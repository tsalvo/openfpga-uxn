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
-- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_a1d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2685_c2_0575]
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2685_c2_0575]
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2685_c2_0575]
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2685_c2_0575]
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_0575]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_0575]
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_0575]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_0575]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_0575]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_0575]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_0575]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_0575]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_0575]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2685_c2_0575]
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2685_c2_0575]
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_b44e]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2698_c7_ab36]
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_5453]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2701_c7_88dc]
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_37fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2705_c7_99f6]
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_c3ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2709_c7_74ca]
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2709_c7_74ca]
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_74ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_74ca]
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_74ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_74ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_74ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2709_c7_74ca]
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2709_c7_74ca]
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_6c84]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2713_c7_21e8]
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2713_c7_21e8]
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_21e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_21e8]
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_21e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_21e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_21e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2713_c7_21e8]
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_b65d]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2717_c7_fd06]
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2717_c7_fd06]
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_fd06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_fd06]
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_fd06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_fd06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_fd06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2719_c30_b9e9]
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_3785]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2724_c7_89d4]
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_89d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_89d4]
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_89d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_89d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_eb5f]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_f8de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_f8de]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_f8de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_a116]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_000d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_000d]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_000d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_790a]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_a44a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_a44a]
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_a44a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_43e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_30cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_30cc]
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_30cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2685_c2_0575
l16_low_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2685_c2_0575
t16_high_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2685_c2_0575
l16_high_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2685_c2_0575
t16_low_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2685_c2_0575
n16_low_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2685_c2_0575
n16_high_MUX_uxn_opcodes_h_l2685_c2_0575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond,
n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue,
n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse,
n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36
l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36
t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36
l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36
t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36
n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36
n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond,
n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue,
n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse,
n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc
l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc
t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc
l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc
t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc
n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc
n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond,
n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue,
n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse,
n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6
l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6
l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6
t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6
n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6
n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond,
n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue,
n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse,
n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca
l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond,
l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue,
l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse,
l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca
l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond,
l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue,
l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse,
l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_cond,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca
n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond,
n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue,
n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse,
n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca
n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond,
n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue,
n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse,
n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8
l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond,
l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue,
l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse,
l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8
l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_cond,
l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue,
l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse,
l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8
n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond,
n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue,
n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse,
n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06
l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_cond,
l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue,
l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse,
l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06
l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_cond,
l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue,
l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse,
l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_cond,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9
sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_ins,
sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_x,
sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_y,
sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4
l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_cond,
l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue,
l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse,
l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output,
 l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output,
 l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output,
 l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output,
 l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output,
 l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output,
 l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output,
 n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output,
 n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output,
 l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output,
 l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output,
 n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output,
 l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output,
 l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output,
 sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output,
 l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_0b43 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_6ed9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_8e47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_2b33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_e697 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_6955 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_ee7b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_303e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_9f32 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_031e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_96d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_97be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_c6f2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_daac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_30cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_fe2b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_34c6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2681_l2748_DUPLICATE_4e41_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_0b43 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_0b43;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_right := to_unsigned(10, 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_ee7b := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_ee7b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_8e47 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_8e47;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_97be := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_97be;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_c6f2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_c6f2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_9f32 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_9f32;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_6ed9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_6ed9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_6955 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_6955;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_96d7 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_96d7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_e697 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_e697;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_303e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_303e;
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_2b33 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_2b33;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_031e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_031e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_daac := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_daac;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := t16_low;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_0575_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_6c84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_3785] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_b44e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_43e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_b65d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_a116] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_0575_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_790a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2719_c30_b9e9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_ins;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_x;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_return_output := sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2742_c7_30cc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_30cc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_37fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_c3ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_5453] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_0575_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_eb5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_a1d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_0575_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_34c6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_34c6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_fe2b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_fe2b_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_a1d7_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_b44e_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5453_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_37fe_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_c3ae_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_6c84_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_b65d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_eb5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a116_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_790a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_43e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_34c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_34c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_34c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_34c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_34c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_34c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_fb64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_fe2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_fe2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_fe2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_fe2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_fe2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_fe2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_5f42_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_0575_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_0575_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_0575_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_0575_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_30cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_b9e9_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2713_c7_21e8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output := n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_30cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_30cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2709_c7_74ca] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output := n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_89d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2724_c7_89d4] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_cond;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output := l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_fd06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2717_c7_fd06] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_cond;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output := l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_30cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_30cc_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2713_c7_21e8] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_cond;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output := l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_a44a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_fd06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_a44a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2709_c7_74ca] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output := n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_a44a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_21e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2717_c7_fd06] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_cond;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output := l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_a44a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_000d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2709_c7_74ca] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_cond;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output := l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2713_c7_21e8] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_cond;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output := l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_000d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_000d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_21e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_74ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_000d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_000d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_000d_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_f8de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_74ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_f8de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2709_c7_74ca] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_cond;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output := l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_f8de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_f8de_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_89d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_89d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_89d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_89d4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_fd06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_fd06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_fd06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output := result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_fd06_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_21e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_21e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_21e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_21e8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_74ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_74ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_74ca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output := result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_74ca_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_99f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_99f6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_88dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_88dc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_ab36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_ab36_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_0575] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2681_l2748_DUPLICATE_4e41 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2681_l2748_DUPLICATE_4e41_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0575_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0575_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2681_l2748_DUPLICATE_4e41_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2681_l2748_DUPLICATE_4e41_return_output;
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
