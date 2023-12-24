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
-- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_0a7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2685_c2_275b]
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2685_c2_275b]
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2685_c2_275b]
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2685_c2_275b]
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_275b]
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_275b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_275b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_275b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_275b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_275b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_275b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_275b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_275b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2685_c2_275b]
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2685_c2_275b]
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_228c]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2698_c7_a014]
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2698_c7_a014]
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2698_c7_a014]
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2698_c7_a014]
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_a014]
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_a014]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_a014]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_a014]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_a014]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2698_c7_a014]
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2698_c7_a014]
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_8eb1]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2701_c7_1ba9]
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_15b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2705_c7_303c]
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2705_c7_303c]
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2705_c7_303c]
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2705_c7_303c]
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_303c]
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_303c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_303c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_303c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_303c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2705_c7_303c]
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_fa0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2709_c7_4116]
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2709_c7_4116]
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2709_c7_4116]
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_4116]
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_4116]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_4116]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_4116]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_4116]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2709_c7_4116]
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_5081]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2713_c7_b29d]
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2713_c7_b29d]
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_b29d]
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_b29d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_b29d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_b29d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_b29d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2713_c7_b29d]
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_8b03]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2717_c7_af99]
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_af99]
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_af99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_af99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_af99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_af99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2717_c7_af99]
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2719_c30_c475]
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_b79a]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_2f38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_2f38]
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_2f38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_2f38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2724_c7_2f38]
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_92d5]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_251e]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_251e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_251e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_4728]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_7794]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_7794]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_7794]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_8ced]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_416f]
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_416f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_416f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_dfb7]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_3b16]
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_3b16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_3b16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2685_c2_275b
n16_low_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2685_c2_275b
n16_high_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2685_c2_275b
t16_low_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2685_c2_275b
l16_high_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2685_c2_275b
t16_high_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2685_c2_275b
l16_low_MUX_uxn_opcodes_h_l2685_c2_275b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond,
l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue,
l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse,
l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2698_c7_a014
n16_low_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2698_c7_a014
n16_high_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2698_c7_a014
t16_low_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2698_c7_a014
l16_high_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2698_c7_a014
t16_high_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2698_c7_a014
l16_low_MUX_uxn_opcodes_h_l2698_c7_a014 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond,
l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue,
l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse,
l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9
n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9
n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9
t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9
l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9
t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9
l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond,
l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue,
l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse,
l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2705_c7_303c
n16_low_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2705_c7_303c
n16_high_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2705_c7_303c
t16_low_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2705_c7_303c
l16_high_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2705_c7_303c
l16_low_MUX_uxn_opcodes_h_l2705_c7_303c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond,
l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue,
l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse,
l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2709_c7_4116
n16_low_MUX_uxn_opcodes_h_l2709_c7_4116 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond,
n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue,
n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse,
n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2709_c7_4116
n16_high_MUX_uxn_opcodes_h_l2709_c7_4116 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond,
n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue,
n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse,
n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2709_c7_4116
l16_high_MUX_uxn_opcodes_h_l2709_c7_4116 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond,
l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue,
l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse,
l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_cond,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2709_c7_4116
l16_low_MUX_uxn_opcodes_h_l2709_c7_4116 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond,
l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue,
l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse,
l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d
n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond,
n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d
l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_cond,
l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue,
l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse,
l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d
l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond,
l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue,
l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse,
l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2717_c7_af99
l16_high_MUX_uxn_opcodes_h_l2717_c7_af99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_cond,
l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue,
l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse,
l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_cond,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2717_c7_af99
l16_low_MUX_uxn_opcodes_h_l2717_c7_af99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_cond,
l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue,
l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse,
l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2719_c30_c475
sp_relative_shift_uxn_opcodes_h_l2719_c30_c475 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_ins,
sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_x,
sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_y,
sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_cond,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38
l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_cond,
l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue,
l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse,
l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_cond,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output,
 n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output,
 n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output,
 n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output,
 n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output,
 n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output,
 l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_return_output,
 l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output,
 n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output,
 l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output,
 l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output,
 l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_return_output,
 l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_return_output,
 sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output,
 l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_6657 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_a598 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_07da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_b506 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_c175 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_5b9e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_9910 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_5214 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_1b6b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_48e9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_833a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_f56a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_b78e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_b6d9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_3b16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_6b03_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_4a5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2681_l2748_DUPLICATE_1566_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_6657 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_6657;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_5b9e := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_5b9e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_b506 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_b506;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_f56a := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_f56a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_b6d9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_b6d9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_9910 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_9910;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_5214 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_5214;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_right := to_unsigned(6, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_833a := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_833a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_b78e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_b78e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_07da := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_07da;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_1b6b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_1b6b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_right := to_unsigned(8, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_c175 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_c175;
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_48e9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_48e9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_right := to_unsigned(9, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_a598 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_a598;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := t16_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_275b_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_4728] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_8b03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_92d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_15b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_fa0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_8eb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_275b_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_0a7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2719_c30_c475] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_ins;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_x;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_return_output := sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_4a5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_4a5a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_b79a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_6b03 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_6b03_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_275b_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2742_c7_3b16] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_3b16_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_275b_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_8ced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_5081] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_228c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_dfb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_return_output;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_0a7a_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_228c_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8eb1_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_15b7_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_fa0a_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5081_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_8b03_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b79a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_92d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4728_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_8ced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dfb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_6b03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_6b03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_6b03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_6b03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_6b03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_6b03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_l2738_DUPLICATE_2497_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_4a5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_4a5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_4a5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_4a5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_4a5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_4a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_c2fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_275b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_275b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_275b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_275b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_3b16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_c475_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_2f38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_3b16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_3b16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output := result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2717_c7_af99] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_cond;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_return_output := l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_af99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2713_c7_b29d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output := n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2709_c7_4116] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output := n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_3b16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2724_c7_2f38] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_cond;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output := l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3b16_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_416f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2717_c7_af99] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_cond;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_return_output := l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_416f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_416f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2713_c7_b29d] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_cond;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output := l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_af99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_b29d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2709_c7_4116] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output := n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_416f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_416f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_416f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_7794] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2713_c7_b29d] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_cond;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output := l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2709_c7_4116] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_cond;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output := l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_7794] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_7794] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_b29d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_4116] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_7794_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_7794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_7794_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_251e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_251e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2709_c7_4116] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_cond;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output := l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_4116] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_251e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_251e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_251e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_251e_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_2f38] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output := result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_2f38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_2f38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_2f38_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_af99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_af99] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_return_output := result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_af99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_af99_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_b29d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_b29d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_b29d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_b29d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_4116] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_4116] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_return_output := result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_4116] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4116_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_303c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_303c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_1ba9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_1ba9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_a014] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_return_output := result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_a014_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_275b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2681_l2748_DUPLICATE_1566 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2681_l2748_DUPLICATE_1566_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_275b_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2681_l2748_DUPLICATE_1566_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2681_l2748_DUPLICATE_1566_return_output;
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
