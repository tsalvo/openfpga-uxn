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
-- BIN_OP_EQ[uxn_opcodes_h_l2513_c6_2906]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2513_c2_dfb0]
signal t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_d308]
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2526_c7_d1c9]
signal n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2526_c7_d1c9]
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_d1c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_d1c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_d1c9]
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_d1c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_d1c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2526_c7_d1c9]
signal t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2529_c11_d425]
signal BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2529_c7_948f]
signal n16_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2529_c7_948f]
signal tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2529_c7_948f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2529_c7_948f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2529_c7_948f]
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2529_c7_948f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2529_c7_948f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2529_c7_948f]
signal t16_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_dc70]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2534_c7_db78]
signal n16_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2534_c7_db78]
signal tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_db78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_db78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_db78]
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_db78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_db78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2534_c7_db78]
signal t16_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2535_c3_a6dc]
signal BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2538_c11_0f5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2538_c7_df06]
signal n16_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2538_c7_df06]
signal tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2538_c7_df06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2538_c7_df06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2538_c7_df06]
signal result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2538_c7_df06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2538_c7_df06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2542_c11_1c04]
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2542_c7_1953]
signal n16_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2542_c7_1953]
signal tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2542_c7_1953]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2542_c7_1953]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2542_c7_1953]
signal result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2542_c7_1953]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2542_c7_1953]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2543_c3_1592]
signal BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2544_c11_8dc4]
signal BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2545_c30_36dc]
signal sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_93f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2550_c7_5c55]
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_5c55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c7_5c55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_5c55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2553_c31_037c]
signal CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906
BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output);

-- n16_MUX_uxn_opcodes_h_l2513_c2_dfb0
n16_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0
tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- t16_MUX_uxn_opcodes_h_l2513_c2_dfb0
t16_MUX_uxn_opcodes_h_l2513_c2_dfb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond,
t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue,
t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse,
t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_left,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_right,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output);

-- n16_MUX_uxn_opcodes_h_l2526_c7_d1c9
n16_MUX_uxn_opcodes_h_l2526_c7_d1c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond,
n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue,
n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse,
n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9
tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond,
tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output);

-- t16_MUX_uxn_opcodes_h_l2526_c7_d1c9
t16_MUX_uxn_opcodes_h_l2526_c7_d1c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond,
t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue,
t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse,
t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_left,
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_right,
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output);

-- n16_MUX_uxn_opcodes_h_l2529_c7_948f
n16_MUX_uxn_opcodes_h_l2529_c7_948f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2529_c7_948f_cond,
n16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue,
n16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse,
n16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2529_c7_948f
tmp16_MUX_uxn_opcodes_h_l2529_c7_948f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_cond,
tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_return_output);

-- t16_MUX_uxn_opcodes_h_l2529_c7_948f
t16_MUX_uxn_opcodes_h_l2529_c7_948f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2529_c7_948f_cond,
t16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue,
t16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse,
t16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output);

-- n16_MUX_uxn_opcodes_h_l2534_c7_db78
n16_MUX_uxn_opcodes_h_l2534_c7_db78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2534_c7_db78_cond,
n16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue,
n16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse,
n16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2534_c7_db78
tmp16_MUX_uxn_opcodes_h_l2534_c7_db78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_cond,
tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue,
tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse,
tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_cond,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_return_output);

-- t16_MUX_uxn_opcodes_h_l2534_c7_db78
t16_MUX_uxn_opcodes_h_l2534_c7_db78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2534_c7_db78_cond,
t16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue,
t16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse,
t16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc
BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_left,
BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_right,
BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output);

-- n16_MUX_uxn_opcodes_h_l2538_c7_df06
n16_MUX_uxn_opcodes_h_l2538_c7_df06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2538_c7_df06_cond,
n16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue,
n16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse,
n16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2538_c7_df06
tmp16_MUX_uxn_opcodes_h_l2538_c7_df06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_cond,
tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue,
tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse,
tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_cond,
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_left,
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_right,
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output);

-- n16_MUX_uxn_opcodes_h_l2542_c7_1953
n16_MUX_uxn_opcodes_h_l2542_c7_1953 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2542_c7_1953_cond,
n16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue,
n16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse,
n16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2542_c7_1953
tmp16_MUX_uxn_opcodes_h_l2542_c7_1953 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_cond,
tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue,
tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse,
tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_cond,
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592
BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_left,
BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_right,
BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4
BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_left,
BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_right,
BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc
sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_ins,
sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_x,
sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_y,
sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_cond,
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2553_c31_037c
CONST_SR_8_uxn_opcodes_h_l2553_c31_037c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_x,
CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65
CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output,
 n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output,
 n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output,
 t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output,
 n16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_return_output,
 t16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output,
 n16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output,
 tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_return_output,
 t16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output,
 n16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output,
 tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output,
 n16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output,
 tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_return_output,
 sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output,
 CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2518_c3_fa54 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2523_c3_0111 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2527_c3_9d0a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_db53 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_28d1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_3734 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2548_c21_c03f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2551_c3_950d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_fa34 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2553_c21_4287_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2513_l2550_DUPLICATE_c52f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_l2542_DUPLICATE_7f94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_DUPLICATE_f623_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2542_DUPLICATE_d4b8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2535_l2539_l2543_DUPLICATE_f02d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_cf83_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2557_l2509_DUPLICATE_2522_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_db53 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_db53;
     VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2518_c3_fa54 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2518_c3_fa54;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_fa34 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_fa34;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_28d1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_28d1;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2551_c3_950d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2551_c3_950d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2523_c3_0111 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2523_c3_0111;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_3734 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_3734;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2527_c3_9d0a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2527_c3_9d0a;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_93f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_cf83 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_cf83_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2538_c11_0f5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2542_DUPLICATE_d4b8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2542_DUPLICATE_d4b8_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2535_l2539_l2543_DUPLICATE_f02d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2535_l2539_l2543_DUPLICATE_f02d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l2545_c30_36dc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_ins;
     sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_x;
     sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_return_output := sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c6_2906] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_DUPLICATE_f623 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_DUPLICATE_f623_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2513_l2550_DUPLICATE_c52f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2513_l2550_DUPLICATE_c52f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_d308] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_left;
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output := BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_l2542_DUPLICATE_7f94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_l2542_DUPLICATE_7f94_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l2553_c31_037c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_return_output := CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2542_c11_1c04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_dc70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2529_c11_d425] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_left;
     BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output := BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_2906_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_d308_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_d425_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_dc70_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_0f5a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_1c04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_93f0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2535_l2539_l2543_DUPLICATE_f02d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2535_l2539_l2543_DUPLICATE_f02d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2535_l2539_l2543_DUPLICATE_f02d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_DUPLICATE_f623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_DUPLICATE_f623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_DUPLICATE_f623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_DUPLICATE_f623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_DUPLICATE_f623_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_l2542_DUPLICATE_7f94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_l2542_DUPLICATE_7f94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_l2542_DUPLICATE_7f94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_l2542_DUPLICATE_7f94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_l2542_DUPLICATE_7f94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2550_l2542_DUPLICATE_7f94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2542_DUPLICATE_d4b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2542_DUPLICATE_d4b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2542_DUPLICATE_d4b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2542_DUPLICATE_d4b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2542_DUPLICATE_d4b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_cf83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_cf83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2513_l2550_DUPLICATE_c52f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2513_l2550_DUPLICATE_c52f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2513_l2550_DUPLICATE_c52f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2513_l2550_DUPLICATE_c52f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2513_l2550_DUPLICATE_c52f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2538_l2534_l2529_l2526_l2513_l2550_DUPLICATE_c52f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2513_c2_dfb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_36dc_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2535_c3_a6dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_left;
     BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_return_output := BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_5c55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_5c55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2553_c21_4287] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2553_c21_4287_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_037c_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2543_c3_1592] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_left;
     BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_return_output := BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c7_5c55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2542_c7_1953] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_a6dc_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_1592_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2553_c21_4287_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2531_l2540_DUPLICATE_0e65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2542_c7_1953] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2542_c7_1953] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2544_c11_8dc4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2550_c7_5c55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output := result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output;

     -- n16_MUX[uxn_opcodes_h_l2542_c7_1953] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2542_c7_1953_cond <= VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_cond;
     n16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue;
     n16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output := n16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2538_c7_df06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;

     -- t16_MUX[uxn_opcodes_h_l2534_c7_db78] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2534_c7_db78_cond <= VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_cond;
     t16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue;
     t16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output := t16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2542_c7_1953] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_5c55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;
     -- n16_MUX[uxn_opcodes_h_l2538_c7_df06] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2538_c7_df06_cond <= VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_cond;
     n16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue;
     n16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output := n16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2538_c7_df06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2548_c21_c03f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2548_c21_c03f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_8dc4_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2542_c7_1953] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_cond;
     tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output := tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2538_c7_df06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2538_c7_df06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_db78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;

     -- t16_MUX[uxn_opcodes_h_l2529_c7_948f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2529_c7_948f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_cond;
     t16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue;
     t16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output := t16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2548_c21_c03f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_db78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2538_c7_df06] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_cond;
     tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output := tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;

     -- n16_MUX[uxn_opcodes_h_l2534_c7_db78] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2534_c7_db78_cond <= VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_cond;
     n16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue;
     n16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output := n16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_db78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_db78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2542_c7_1953] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_return_output := result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2529_c7_948f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2526_c7_d1c9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond;
     t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue;
     t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output := t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1953_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2538_c7_df06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_return_output := result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_d1c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2534_c7_db78] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_cond;
     tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output := tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2529_c7_948f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2529_c7_948f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2529_c7_948f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2529_c7_948f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_cond;
     n16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue;
     n16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output := n16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2529_c7_948f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_df06_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2529_c7_948f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_cond;
     tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output := tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_d1c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_d1c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_d1c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_db78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_return_output := result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2526_c7_d1c9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond;
     n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue;
     n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output := n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_db78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2529_c7_948f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2526_c7_d1c9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output := tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_948f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_d1c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_d1c9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2513_c2_dfb0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2557_l2509_DUPLICATE_2522 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2557_l2509_DUPLICATE_2522_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_dfb0_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2557_l2509_DUPLICATE_2522_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2557_l2509_DUPLICATE_2522_return_output;
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
