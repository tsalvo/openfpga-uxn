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
-- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_ad04]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2685_c2_4d46]
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_74f9]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2698_c7_0b14]
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_c32f]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2701_c7_c982]
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_c982]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_c982]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_c982]
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_c982]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_c982]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2701_c7_c982]
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2701_c7_c982]
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2701_c7_c982]
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2701_c7_c982]
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2701_c7_c982]
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_14eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_723e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_723e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_723e]
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_723e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_723e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2705_c7_723e]
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2705_c7_723e]
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2705_c7_723e]
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2705_c7_723e]
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2705_c7_723e]
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_4a99]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_ecba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_ecba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_ecba]
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_ecba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_ecba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2709_c7_ecba]
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2709_c7_ecba]
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2709_c7_ecba]
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2709_c7_ecba]
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_b7d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_d05f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_d05f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_d05f]
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_d05f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_d05f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2713_c7_d05f]
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2713_c7_d05f]
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2713_c7_d05f]
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_90e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_4c57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_4c57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_4c57]
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_4c57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_4c57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2717_c7_4c57]
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2717_c7_4c57]
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2719_c30_e791]
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_bdfc]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_e7a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_e7a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_e7a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_e7a3]
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2724_c7_e7a3]
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_f46c]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_1ed8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_1ed8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_1ed8]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_a009]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_11e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_11e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_11e1]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_4cec]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_b478]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_b478]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_b478]
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_6db1]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_3fb9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_3fb9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_3fb9]
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46
t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46
n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46
l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46
n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46
l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46
t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond,
t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue,
t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse,
t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14
t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14
n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14
l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14
n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14
l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14
t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond,
t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue,
t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse,
t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2701_c7_c982
t16_high_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2701_c7_c982
n16_high_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2701_c7_c982
l16_high_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2701_c7_c982
n16_low_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2701_c7_c982
l16_low_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2701_c7_c982
t16_low_MUX_uxn_opcodes_h_l2701_c7_c982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond,
t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue,
t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse,
t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2705_c7_723e
n16_high_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2705_c7_723e
l16_high_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2705_c7_723e
n16_low_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2705_c7_723e
l16_low_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2705_c7_723e
t16_low_MUX_uxn_opcodes_h_l2705_c7_723e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond,
t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue,
t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse,
t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_cond,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba
n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond,
n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue,
n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse,
n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba
l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond,
l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue,
l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse,
l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba
n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond,
n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue,
n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse,
n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba
l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond,
l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue,
l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse,
l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f
l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_cond,
l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue,
l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse,
l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f
n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond,
n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f
l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond,
l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue,
l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse,
l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_cond,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57
l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_cond,
l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue,
l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse,
l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57
l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_cond,
l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue,
l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse,
l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2719_c30_e791
sp_relative_shift_uxn_opcodes_h_l2719_c30_e791 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_ins,
sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_x,
sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_y,
sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3
l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond,
l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue,
l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse,
l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_cond,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output,
 t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output,
 t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output,
 t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output,
 n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output,
 l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output,
 n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output,
 l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output,
 l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output,
 l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output,
 l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output,
 l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output,
 sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output,
 l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_d0ee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_a9b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_b431 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_7b77 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_0fbf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_c9dd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_92e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_e631 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_59c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_2592 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_386e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_9589 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_7b04 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_1722 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_3fb9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_7216_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_6211_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2681_l2748_DUPLICATE_09ea_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_0fbf := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_0fbf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_92e4 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_92e4;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_a9b7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_a9b7;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_1722 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_1722;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_right := to_unsigned(11, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_b431 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_b431;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_2592 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_2592;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_9589 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_9589;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_7b77 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_7b77;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_7b04 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_7b04;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_d0ee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_d0ee;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_e631 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_e631;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_386e := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_386e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_c9dd := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_c9dd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_59c0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_59c0;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := t16_low;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_14eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_b7d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_6211 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_6211_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_a009] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_c32f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_ad04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_74f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_bdfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_4cec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2719_c30_e791] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_ins;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_x;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_return_output := sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_7216 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_7216_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_90e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2742_c7_3fb9] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_3fb9_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_4a99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_f46c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_6db1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_return_output;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_ad04_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_74f9_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_c32f_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_14eb_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_4a99_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_b7d3_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_90e2_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bdfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_f46c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a009_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4cec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6db1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_7216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_7216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_7216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_7216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_7216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_7216_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_9c36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_6211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_6211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_6211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_6211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_6211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_6211_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_5d5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_4d46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_3fb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_e791_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2717_c7_4c57] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_cond;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output := l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2709_c7_ecba] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output := n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2724_c7_e7a3] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output := l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_3fb9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_4c57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2713_c7_d05f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output := n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_3fb9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_3fb9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_e7a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_3fb9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_4c57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2717_c7_4c57] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_cond;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output := l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_b478] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2713_c7_d05f] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_cond;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output := l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2709_c7_ecba] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output := n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_d05f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_b478] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_b478] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_return_output := result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_b478_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_b478_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_b478_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_11e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_11e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2713_c7_d05f] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_cond;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output := l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_d05f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2709_c7_ecba] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_cond;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output := l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_11e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_ecba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_11e1_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_ecba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_1ed8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_1ed8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_1ed8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2709_c7_ecba] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_cond;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output := l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_1ed8_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_e7a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_e7a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_e7a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_e7a3_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_4c57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_4c57] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output := result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_4c57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_4c57_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_d05f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_d05f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_d05f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_d05f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_ecba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output := result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_ecba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_ecba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_ecba_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_723e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_723e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_c982] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_c982_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_0b14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_0b14_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_4d46] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output := result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2681_l2748_DUPLICATE_09ea LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2681_l2748_DUPLICATE_09ea_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_4d46_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2681_l2748_DUPLICATE_09ea_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2681_l2748_DUPLICATE_09ea_return_output;
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
