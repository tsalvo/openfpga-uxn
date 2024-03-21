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
-- Submodules: 102
entity rot2_0CLK_8e773831 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_8e773831;
architecture arch of rot2_0CLK_8e773831 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_l16_high : unsigned(7 downto 0);
signal REG_COMB_l16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2686_c6_3d2a]
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2686_c2_7333]
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2686_c2_7333]
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2686_c2_7333]
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2686_c2_7333]
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c2_7333]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c2_7333]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2686_c2_7333]
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c2_7333]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2686_c2_7333]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2686_c2_7333]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2686_c2_7333]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c2_7333]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c2_7333]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2686_c2_7333]
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2686_c2_7333]
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_ef28]
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2699_c7_005e]
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2699_c7_005e]
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2699_c7_005e]
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2699_c7_005e]
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2699_c7_005e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_005e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2699_c7_005e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2699_c7_005e]
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_005e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2699_c7_005e]
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2699_c7_005e]
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_da98]
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2702_c7_2a73]
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_cfeb]
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2706_c7_cdc8]
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_c250]
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2710_c7_7d6d]
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2710_c7_7d6d]
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2710_c7_7d6d]
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c7_7d6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c7_7d6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c7_7d6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2710_c7_7d6d]
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c7_7d6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2710_c7_7d6d]
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_e7d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2714_c7_df54]
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2714_c7_df54]
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2714_c7_df54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2714_c7_df54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2714_c7_df54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2714_c7_df54]
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2714_c7_df54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2714_c7_df54]
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_078e]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2718_c7_1a67]
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_1a67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_1a67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_1a67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_1a67]
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_1a67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2718_c7_1a67]
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2720_c30_fbff]
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_54de]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2725_c7_4bcd]
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2725_c7_4bcd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2725_c7_4bcd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2725_c7_4bcd]
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2725_c7_4bcd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_861a]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_dd5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_dd5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_dd5c]
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_060f]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_b6ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_b6ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_b6ac]
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_8536]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_eb34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_eb34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2739_c7_eb34]
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_5e01]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_e328]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_e328]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2743_c7_e328]
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_left,
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_right,
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2686_c2_7333
t16_high_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2686_c2_7333
n16_low_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2686_c2_7333
l16_low_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2686_c2_7333
n16_high_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2686_c2_7333
t16_low_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2686_c2_7333
l16_high_MUX_uxn_opcodes_h_l2686_c2_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond,
l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue,
l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse,
l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_left,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_right,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2699_c7_005e
t16_high_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2699_c7_005e
n16_low_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2699_c7_005e
l16_low_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2699_c7_005e
n16_high_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2699_c7_005e
t16_low_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2699_c7_005e
l16_high_MUX_uxn_opcodes_h_l2699_c7_005e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond,
l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue,
l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse,
l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_left,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_right,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73
t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73
n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73
l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73
n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73
t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73
l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond,
l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue,
l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse,
l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_left,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_right,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8
n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8
l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8
n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8
t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8
l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond,
l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue,
l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse,
l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_left,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_right,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d
n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond,
n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d
l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond,
l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue,
l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse,
l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d
n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond,
n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d
l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond,
l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue,
l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse,
l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2714_c7_df54
n16_low_MUX_uxn_opcodes_h_l2714_c7_df54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond,
n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue,
n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse,
n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2714_c7_df54
l16_low_MUX_uxn_opcodes_h_l2714_c7_df54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond,
l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue,
l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse,
l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_cond,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2714_c7_df54
l16_high_MUX_uxn_opcodes_h_l2714_c7_df54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_cond,
l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue,
l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse,
l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67
l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_cond,
l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue,
l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse,
l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_cond,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67
l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_cond,
l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue,
l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse,
l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff
sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_ins,
sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_x,
sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_y,
sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd
l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond,
l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue,
l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse,
l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_cond,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_cond,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16_high,
 t16_low,
 n16_high,
 n16_low,
 l16_high,
 l16_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output,
 t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output,
 t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output,
 t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output,
 n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output,
 n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output,
 l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output,
 l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output,
 n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output,
 l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_return_output,
 l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output,
 l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output,
 l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output,
 sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output,
 l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_4f39 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_9ba6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_98a0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_b7bb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_49d5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_21a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_fcae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_5b41 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_65d3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_62ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_3bd1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_306e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_0164 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_3cd4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_e328_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_9e48_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_f0e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2682_l2749_DUPLICATE_6261_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_l16_high : unsigned(7 downto 0);
variable REG_VAR_l16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_high := t16_high;
  REG_VAR_t16_low := t16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_l16_high := l16_high;
  REG_VAR_l16_low := l16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_5b41 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_5b41;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_9ba6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_9ba6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_21a4 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_21a4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_98a0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_98a0;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_4f39 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_4f39;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_49d5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_49d5;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_fcae := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_fcae;
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_62ae := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_62ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_0164 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_0164;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_3cd4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_3cd4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_306e := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_306e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_65d3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_65d3;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_b7bb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_b7bb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_3bd1 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_3bd1;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := t16_low;
     -- sp_relative_shift[uxn_opcodes_h_l2720_c30_fbff] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_ins;
     sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_x;
     sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_return_output := sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2686_c6_3d2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_cfeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_c250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_left;
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output := BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_ef28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_left;
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output := BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_da98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_left;
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output := BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_8536] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_7333_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_861a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_7333_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_078e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_f0e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_f0e9_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_54de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_9e48 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_9e48_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2743_c7_e328] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_e328_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_5e01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_7333_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_e7d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_060f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_7333_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_3d2a_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_ef28_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_da98_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cfeb_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_c250_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_e7d0_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_078e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_54de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_861a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_060f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_8536_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_9e48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_9e48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_9e48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_9e48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_9e48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_9e48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_5271_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_f0e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_f0e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_f0e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_f0e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_f0e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_f0e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_879d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_7333_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_7333_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_7333_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_7333_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_e328_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_fbff_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2725_c7_4bcd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_1a67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_e328] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2718_c7_1a67] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_cond;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output := l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2714_c7_df54] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond;
     n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output := n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_e328] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2710_c7_7d6d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond;
     n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output := n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2743_c7_e328] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_return_output := result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2725_c7_4bcd] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond;
     l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output := l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e328_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e328_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2714_c7_df54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2718_c7_1a67] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_cond;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output := l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_1a67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_eb34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_eb34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2714_c7_df54] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_cond;
     l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_return_output := l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2739_c7_eb34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output := result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2710_c7_7d6d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond;
     n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output := n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_eb34_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2714_c7_df54] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_cond;
     l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output := l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_b6ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2710_c7_7d6d] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond;
     l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output := l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_b6ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c7_7d6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2714_c7_df54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_b6ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b6ac_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2710_c7_7d6d] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond;
     l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output := l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_dd5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_dd5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c7_7d6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_dd5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_dd5c_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2725_c7_4bcd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2725_c7_4bcd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2725_c7_4bcd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_4bcd_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_1a67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_1a67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_1a67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output := result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_1a67_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2714_c7_df54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_return_output := result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2714_c7_df54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2714_c7_df54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_df54_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2710_c7_7d6d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c7_7d6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c7_7d6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_7d6d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2706_c7_cdc8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_cdc8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c7_2a73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2a73_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2699_c7_005e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_005e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c2_7333] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2682_l2749_DUPLICATE_6261 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2682_l2749_DUPLICATE_6261_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_7333_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2682_l2749_DUPLICATE_6261_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2682_l2749_DUPLICATE_6261_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_l16_high <= REG_VAR_l16_high;
REG_COMB_l16_low <= REG_VAR_l16_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16_high <= REG_COMB_t16_high;
     t16_low <= REG_COMB_t16_low;
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     l16_high <= REG_COMB_l16_high;
     l16_low <= REG_COMB_l16_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
