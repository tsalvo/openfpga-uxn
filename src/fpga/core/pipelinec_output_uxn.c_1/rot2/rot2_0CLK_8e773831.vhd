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
-- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_9ad5]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2685_c2_7861]
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_7861]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_7861]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_7861]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_7861]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_7861]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_7861]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_7861]
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_7861]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_7861]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2685_c2_7861]
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2685_c2_7861]
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2685_c2_7861]
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2685_c2_7861]
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2685_c2_7861]
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_24d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2698_c7_c2ce]
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_8172]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2701_c7_ca50]
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_cb6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2705_c7_6abd]
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_37a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_5055]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_5055]
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_5055]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_5055]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_5055]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2709_c7_5055]
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2709_c7_5055]
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2709_c7_5055]
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2709_c7_5055]
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_c8aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_13dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_13dd]
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_13dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_13dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_13dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2713_c7_13dd]
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2713_c7_13dd]
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2713_c7_13dd]
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_7ace]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_1503]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_1503]
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_1503]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_1503]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_1503]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2717_c7_1503]
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2717_c7_1503]
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2719_c30_22ad]
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_3a82]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_790d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_790d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_790d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_790d]
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2724_c7_790d]
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_4067]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_a451]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_a451]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_a451]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_b398]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_e8cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_e8cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_e8cd]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_4178]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_987e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_987e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_987e]
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_c207]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_875e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_875e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_875e]
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2685_c2_7861
t16_high_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2685_c2_7861
n16_high_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2685_c2_7861
t16_low_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2685_c2_7861
n16_low_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2685_c2_7861
l16_low_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2685_c2_7861
l16_high_MUX_uxn_opcodes_h_l2685_c2_7861 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond,
l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue,
l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse,
l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce
t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce
n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce
t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce
n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce
l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce
l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond,
l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue,
l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse,
l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50
t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50
n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50
t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50
n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50
l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50
l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond,
l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue,
l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse,
l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd
n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd
t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd
n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd
l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd
l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond,
l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue,
l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse,
l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_cond,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2709_c7_5055
n16_high_MUX_uxn_opcodes_h_l2709_c7_5055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond,
n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue,
n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse,
n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2709_c7_5055
n16_low_MUX_uxn_opcodes_h_l2709_c7_5055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond,
n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue,
n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse,
n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2709_c7_5055
l16_low_MUX_uxn_opcodes_h_l2709_c7_5055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond,
l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue,
l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse,
l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2709_c7_5055
l16_high_MUX_uxn_opcodes_h_l2709_c7_5055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond,
l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue,
l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse,
l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd
n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond,
n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue,
n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse,
n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd
l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond,
l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue,
l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse,
l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd
l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_cond,
l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue,
l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse,
l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_cond,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2717_c7_1503
l16_low_MUX_uxn_opcodes_h_l2717_c7_1503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_cond,
l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue,
l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse,
l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2717_c7_1503
l16_high_MUX_uxn_opcodes_h_l2717_c7_1503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_cond,
l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue,
l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse,
l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad
sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_ins,
sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_x,
sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_y,
sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2724_c7_790d
l16_low_MUX_uxn_opcodes_h_l2724_c7_790d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_cond,
l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue,
l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse,
l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output,
 t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output,
 t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output,
 t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_return_output,
 n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output,
 n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output,
 l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output,
 l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output,
 n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output,
 l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output,
 l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_return_output,
 l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_return_output,
 l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_return_output,
 sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_return_output,
 l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_b82a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_ee4a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_db8c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_0fa7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_d0b8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_ddf7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_f9b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_bec9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_6f7c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_8c57 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_a183 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_297d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_ec7c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_1eb6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_875e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2724_l2713_l2709_l2705_l2701_l2698_DUPLICATE_2dc1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7e3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2748_l2681_DUPLICATE_a6d6_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_ec7c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_ec7c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_right := to_unsigned(9, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_0fa7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_0fa7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_db8c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_db8c;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_ee4a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_ee4a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_ddf7 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_ddf7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_297d := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_297d;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_d0b8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_d0b8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_f9b1 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_f9b1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_8c57 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_8c57;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_b82a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_b82a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_1eb6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_1eb6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_a183 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_a183;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_bec9 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_bec9;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_6f7c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_6f7c;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_b398] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_4178] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_9ad5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_7861_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2724_l2713_l2709_l2705_l2701_l2698_DUPLICATE_2dc1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2724_l2713_l2709_l2705_l2701_l2698_DUPLICATE_2dc1_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2742_c7_875e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_875e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_24d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_7861_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7e3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7e3c_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2719_c30_22ad] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_ins;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_x;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_return_output := sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_3a82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_4067] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_8172] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_7ace] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_c8aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_7861_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_7861_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_cb6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_c207] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_37a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_9ad5_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_24d0_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_8172_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_cb6d_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_37a5_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_c8aa_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7ace_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3a82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4067_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_b398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_c207_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2724_l2713_l2709_l2705_l2701_l2698_DUPLICATE_2dc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2724_l2713_l2709_l2705_l2701_l2698_DUPLICATE_2dc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2724_l2713_l2709_l2705_l2701_l2698_DUPLICATE_2dc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2724_l2713_l2709_l2705_l2701_l2698_DUPLICATE_2dc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2724_l2713_l2709_l2705_l2701_l2698_DUPLICATE_2dc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2724_l2713_l2709_l2705_l2701_l2698_DUPLICATE_2dc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2724_l2717_l2713_l2742_l2709_l2738_l2705_l2734_l2701_l2730_l2698_DUPLICATE_ec99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7e3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7e3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7e3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7e3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7e3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2717_l2713_l2709_l2705_l2701_l2698_DUPLICATE_7e3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2685_l2713_l2742_l2709_l2705_l2701_l2698_DUPLICATE_2ec9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_7861_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_7861_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_7861_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_7861_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_875e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_22ad_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2713_c7_13dd] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output := n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_875e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2717_c7_1503] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_cond;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_return_output := l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_1503] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2709_c7_5055] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output := n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2724_c7_790d] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_cond;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_return_output := l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_875e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_875e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_790d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_875e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_875e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_875e_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_987e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_1503] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_13dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_987e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2709_c7_5055] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output := n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_987e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2717_c7_1503] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_cond;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_return_output := l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2713_c7_13dd] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_cond;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output := l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_987e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_987e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_987e_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2713_c7_13dd] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_cond;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output := l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_13dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2709_c7_5055] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_cond;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output := l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_e8cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_5055] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_e8cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_e8cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_e8cd_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_a451] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_a451] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_5055] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2709_c7_5055] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_cond;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output := l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_a451] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_a451_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_a451_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_a451_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_790d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_790d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_790d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_790d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_1503] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_1503] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_return_output := result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_1503] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_1503_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_13dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_13dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_13dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_13dd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_5055] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_5055] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_5055] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_return_output := result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_5055_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_6abd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_6abd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_ca50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output := result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_ca50_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_c2ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_c2ce_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_7861] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2748_l2681_DUPLICATE_a6d6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2748_l2681_DUPLICATE_a6d6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_7861_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_7861_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2748_l2681_DUPLICATE_a6d6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2748_l2681_DUPLICATE_a6d6_return_output;
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
