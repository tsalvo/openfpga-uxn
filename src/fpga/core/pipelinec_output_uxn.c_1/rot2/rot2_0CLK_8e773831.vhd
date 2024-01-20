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
-- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_ba6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2685_c2_5b81]
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_17e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2698_c7_0e11]
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_b9e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2701_c7_4201]
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2701_c7_4201]
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2701_c7_4201]
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2701_c7_4201]
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2701_c7_4201]
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_4201]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_4201]
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_4201]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_4201]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_4201]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2701_c7_4201]
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_9ad3]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2705_c7_1bd3]
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_28b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2709_c7_4b3d]
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2709_c7_4b3d]
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2709_c7_4b3d]
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_4b3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_4b3d]
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_4b3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_4b3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_4b3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2709_c7_4b3d]
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_acbf]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2713_c7_fed1]
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2713_c7_fed1]
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_fed1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_fed1]
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_fed1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_fed1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_fed1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2713_c7_fed1]
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_0080]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2717_c7_cc18]
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_cc18]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_cc18]
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_cc18]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_cc18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_cc18]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2717_c7_cc18]
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2719_c30_5fe2]
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_b798]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_b7b0]
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_b7b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_b7b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_b7b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2724_c7_b7b0]
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_901a]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_6ab1]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_6ab1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_6ab1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_c42b]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_2c6e]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_2c6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_2c6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_e315]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_115a]
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_115a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_115a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_4b3f]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_f579]
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_f579]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_f579]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81
t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81
n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81
l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81
n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81
t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81
l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond,
l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue,
l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse,
l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11
t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11
n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11
l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11
n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11
t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11
l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond,
l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue,
l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse,
l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2701_c7_4201
t16_low_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2701_c7_4201
n16_high_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2701_c7_4201
l16_high_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2701_c7_4201
n16_low_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2701_c7_4201
t16_high_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2701_c7_4201
l16_low_MUX_uxn_opcodes_h_l2701_c7_4201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond,
l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue,
l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse,
l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3
t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3
n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3
l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3
n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3
l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond,
l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue,
l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse,
l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d
n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond,
n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d
l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond,
l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue,
l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse,
l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d
n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond,
n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d
l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond,
l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue,
l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse,
l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1
l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_cond,
l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue,
l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse,
l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1
n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond,
n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue,
n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse,
n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1
l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond,
l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue,
l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse,
l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18
l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_cond,
l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue,
l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse,
l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_cond,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18
l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_cond,
l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue,
l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse,
l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2
sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_ins,
sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_x,
sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_y,
sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0
l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond,
l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue,
l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse,
l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_cond,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output,
 t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output,
 t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output,
 t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output,
 t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output,
 n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output,
 l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output,
 l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output,
 l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output,
 n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output,
 l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output,
 l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output,
 l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output,
 sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output,
 l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_a90c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_c484 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_12d5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_340f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_ce3f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_75c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_30a0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_3b8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_3486 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_0f9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_3c3a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_42af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_df8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_b391 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_f579_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7a5c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_e394_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2681_l2748_DUPLICATE_9688_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_340f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_340f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_12d5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_12d5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_42af := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_42af;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_3c3a := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_3c3a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_3b8b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_3b8b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_ce3f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_ce3f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_c484 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_c484;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_df8b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_df8b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_75c6 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_75c6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_30a0 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_30a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_b391 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_b391;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_3486 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_3486;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_right := to_unsigned(11, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_0f9b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_0f9b;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_a90c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_a90c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_right := to_unsigned(7, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := t16_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2742_c7_f579] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_f579_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_901a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2719_c30_5fe2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_ins;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_x;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_return_output := sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_28b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_ba6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_b798] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_e315] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_c42b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_0080] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_17e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_b9e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_e394 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_e394_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_9ad3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_4b3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7a5c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7a5c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_acbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ba6d_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_17e6_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_b9e6_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_9ad3_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_28b9_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_acbf_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_0080_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_b798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_901a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c42b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_4b3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_e394_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_e394_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_e394_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_e394_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_e394_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2713_l2709_l2705_l2701_l2698_l2724_DUPLICATE_e394_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_l2724_DUPLICATE_a582_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7a5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7a5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7a5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7a5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7a5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7a5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2713_l2742_l2709_l2705_l2701_l2698_l2685_DUPLICATE_3be8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_5b81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_f579_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_5fe2_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2724_c7_b7b0] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output := l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2709_c7_4b3d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output := n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_f579] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2717_c7_cc18] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_cond;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output := l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_f579] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_f579] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_return_output := result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_cc18] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2713_c7_fed1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output := n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_b7b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_f579_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_f579_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_f579_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_115a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_115a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_cc18] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_fed1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2709_c7_4b3d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output := n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_115a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2713_c7_fed1] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_cond;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output := l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2717_c7_cc18] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_cond;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output := l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_115a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_115a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_115a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_4b3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_fed1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_2c6e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2709_c7_4b3d] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output := l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_2c6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2713_c7_fed1] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_cond;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output := l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_2c6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_2c6e_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_6ab1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2709_c7_4b3d] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output := l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_4b3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_6ab1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_6ab1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_6ab1_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_b7b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_b7b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_b7b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_b7b0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_cc18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_cc18] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_cc18] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output := result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_cc18_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_fed1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_fed1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_fed1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_fed1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_4b3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_4b3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_4b3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_4b3d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_1bd3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1bd3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_4201] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_4201_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_0e11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0e11_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_5b81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output := result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2681_l2748_DUPLICATE_9688 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2681_l2748_DUPLICATE_9688_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_5b81_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2681_l2748_DUPLICATE_9688_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2681_l2748_DUPLICATE_9688_return_output;
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
