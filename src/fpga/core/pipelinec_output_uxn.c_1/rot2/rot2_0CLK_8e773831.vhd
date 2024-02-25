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
-- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_6766]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2685_c2_0f34]
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_c51c]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2698_c7_edab]
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2698_c7_edab]
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_edab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_edab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_edab]
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_edab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_edab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2698_c7_edab]
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2698_c7_edab]
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2698_c7_edab]
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2698_c7_edab]
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_6669]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2701_c7_9f06]
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_1a13]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2705_c7_c15e]
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_32b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2709_c7_2a8b]
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2709_c7_2a8b]
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_2a8b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_2a8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_2a8b]
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_2a8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_2a8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2709_c7_2a8b]
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2709_c7_2a8b]
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_3b6f]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2713_c7_73e1]
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_73e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_73e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_73e1]
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_73e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_73e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2713_c7_73e1]
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2713_c7_73e1]
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_5130]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2717_c7_efa0]
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_efa0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_efa0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_efa0]
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_efa0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_efa0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(3 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2717_c7_efa0]
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2719_c30_bd30]
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_bf91]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2724_c7_1225]
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_1225]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_1225]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_1225]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_1225]
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_35fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_4e3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_4e3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_4e3b]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_c602]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_c103]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_c103]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_c103]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_f621]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_1d17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_1d17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_1d17]
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_39e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_026a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_026a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_026a]
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34
n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34
l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34
n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34
t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34
t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34
l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond,
l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue,
l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse,
l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2698_c7_edab
n16_high_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2698_c7_edab
l16_low_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2698_c7_edab
n16_low_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2698_c7_edab
t16_high_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2698_c7_edab
t16_low_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2698_c7_edab
l16_high_MUX_uxn_opcodes_h_l2698_c7_edab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond,
l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue,
l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse,
l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06
n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06
l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06
n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06
t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06
t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06
l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond,
l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue,
l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse,
l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e
n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e
l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e
n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e
t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e
l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond,
l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue,
l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse,
l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b
n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond,
n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue,
n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse,
n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b
l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond,
l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue,
l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse,
l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b
n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond,
n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue,
n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse,
n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b
l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond,
l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue,
l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse,
l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1
l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond,
l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue,
l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse,
l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1
n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond,
n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue,
n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse,
n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1
l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_cond,
l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue,
l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse,
l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0
l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_cond,
l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue,
l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse,
l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0
l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_cond,
l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue,
l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse,
l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30
sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_ins,
sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_x,
sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_y,
sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2724_c7_1225
l16_low_MUX_uxn_opcodes_h_l2724_c7_1225 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_cond,
l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue,
l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse,
l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_cond,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_cond,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output,
 n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output,
 n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output,
 n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output,
 n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output,
 l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output,
 n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output,
 l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output,
 l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output,
 n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output,
 l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output,
 l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output,
 l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output,
 sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output,
 l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_5acb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_f5b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_7704 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_95e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_e810 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_a898 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_74fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_77c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_6b5e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_1101 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_4b37 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_5752 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_3a24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_e6db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_026a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_8cdf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_affb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2748_l2681_DUPLICATE_a641_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_right := to_unsigned(11, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_5acb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_5acb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_e810 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_e810;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_4b37 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_4b37;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_f5b2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_f5b2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_74fe := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_74fe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_3a24 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_3a24;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_6b5e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_6b5e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_95e4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_95e4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_5752 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_5752;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_77c4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_77c4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_a898 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_a898;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_7704 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_7704;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_right := to_unsigned(7, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_1101 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_1101;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_e6db := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_e6db;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_1a13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_c602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_5130] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_39e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_6766] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_35fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_8cdf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_8cdf_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_32b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_c51c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2742_c7_026a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_026a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_bf91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_f621] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_affb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_affb_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2719_c30_bd30] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_ins;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_x;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_return_output := sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_6669] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_3b6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_6766_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_c51c_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_6669_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_1a13_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_32b0_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_3b6f_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5130_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_bf91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_35fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_f621_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_39e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_affb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_affb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_affb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_affb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_affb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2698_l2724_l2713_l2709_l2705_l2701_DUPLICATE_affb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2698_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_DUPLICATE_b271_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_8cdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_8cdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_8cdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_8cdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_8cdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2698_l2717_l2713_l2709_l2705_l2701_DUPLICATE_8cdf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2698_l2685_l2713_l2742_l2709_l2705_l2701_DUPLICATE_c17f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_0f34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_026a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_bd30_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2709_c7_2a8b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output := n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_1225] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2713_c7_73e1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output := n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_026a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_026a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2717_c7_efa0] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_cond;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output := l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2724_c7_1225] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_cond;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_return_output := l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_efa0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_026a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_026a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_026a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_026a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2717_c7_efa0] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_cond;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output := l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_1d17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2713_c7_73e1] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_cond;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output := l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_1d17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2709_c7_2a8b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output := n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_efa0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_73e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_1d17] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output := result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_1d17_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_c103] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2713_c7_73e1] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_cond;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output := l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_c103] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_2a8b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_c103] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_73e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2709_c7_2a8b] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output := l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_c103_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_c103_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_c103_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_2a8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_4e3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2709_c7_2a8b] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output := l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_4e3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_4e3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_4e3b_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_1225] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_1225] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_1225] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_return_output := result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_1225_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_efa0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_efa0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_efa0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_efa0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_73e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_73e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_73e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_73e1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_2a8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_2a8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_2a8b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_2a8b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_c15e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_c15e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_9f06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output := result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_9f06_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_edab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_edab_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_0f34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2748_l2681_DUPLICATE_a641 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2748_l2681_DUPLICATE_a641_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_0f34_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2748_l2681_DUPLICATE_a641_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2748_l2681_DUPLICATE_a641_return_output;
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
