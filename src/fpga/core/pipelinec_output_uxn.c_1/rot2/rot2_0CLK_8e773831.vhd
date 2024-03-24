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
-- BIN_OP_EQ[uxn_opcodes_h_l2686_c6_2211]
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2686_c2_c5f7]
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_1b4a]
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2699_c7_9843]
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2699_c7_9843]
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2699_c7_9843]
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2699_c7_9843]
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2699_c7_9843]
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2699_c7_9843]
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2699_c7_9843]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_9843]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2699_c7_9843]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_9843]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2699_c7_9843]
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_52a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2702_c7_177f]
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2702_c7_177f]
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2702_c7_177f]
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2702_c7_177f]
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2702_c7_177f]
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2702_c7_177f]
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c7_177f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c7_177f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c7_177f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c7_177f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2702_c7_177f]
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_cd65]
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2706_c7_9b1e]
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_1664]
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2710_c7_362a]
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2710_c7_362a]
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2710_c7_362a]
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2710_c7_362a]
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c7_362a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c7_362a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c7_362a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c7_362a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2710_c7_362a]
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_85ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2714_c7_2e44]
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2714_c7_2e44]
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2714_c7_2e44]
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2714_c7_2e44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2714_c7_2e44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2714_c7_2e44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2714_c7_2e44]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2714_c7_2e44]
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_c689]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2718_c7_a09a]
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2718_c7_a09a]
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_a09a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_a09a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_a09a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_a09a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_a09a]
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2720_c30_a7ac]
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_5d9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2725_c7_de14]
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2725_c7_de14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2725_c7_de14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2725_c7_de14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2725_c7_de14]
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_1fbb]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_80bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_80bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_80bc]
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_ff2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_9ae1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_9ae1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_9ae1]
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_97e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_7663]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_7663]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2739_c7_7663]
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_247f]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_e9b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_e9b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2743_c7_e9b9]
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_left,
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_right,
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7
t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7
n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7
n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7
l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7
l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7
t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_left,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_right,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2699_c7_9843
t16_low_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2699_c7_9843
n16_low_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2699_c7_9843
n16_high_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2699_c7_9843
l16_low_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2699_c7_9843
l16_high_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2699_c7_9843
t16_high_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_cond,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2702_c7_177f
t16_low_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2702_c7_177f
n16_low_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2702_c7_177f
n16_high_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2702_c7_177f
l16_low_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2702_c7_177f
l16_high_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2702_c7_177f
t16_high_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_left,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_right,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e
t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e
n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e
n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e
l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e
l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_left,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_right,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2710_c7_362a
n16_low_MUX_uxn_opcodes_h_l2710_c7_362a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond,
n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue,
n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse,
n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2710_c7_362a
n16_high_MUX_uxn_opcodes_h_l2710_c7_362a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond,
n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue,
n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse,
n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2710_c7_362a
l16_low_MUX_uxn_opcodes_h_l2710_c7_362a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond,
l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue,
l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse,
l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2710_c7_362a
l16_high_MUX_uxn_opcodes_h_l2710_c7_362a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond,
l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue,
l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse,
l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44
n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond,
n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue,
n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse,
n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44
l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond,
l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue,
l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse,
l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44
l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_cond,
l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue,
l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse,
l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_cond,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a
l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_cond,
l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue,
l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse,
l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a
l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_cond,
l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue,
l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse,
l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac
sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_ins,
sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_x,
sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_y,
sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2725_c7_de14
l16_low_MUX_uxn_opcodes_h_l2725_c7_de14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_cond,
l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue,
l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse,
l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_cond,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_cond,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output,
 t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output,
 t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output,
 t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output,
 t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output,
 n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output,
 n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output,
 l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output,
 l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output,
 n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output,
 l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output,
 l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output,
 l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output,
 l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output,
 l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_9325 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_3b3b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_c9d5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_27b8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_e038 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_169d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_3739 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_b967 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_7a6b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_1c08 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_3f9f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_70e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_87d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_899b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_e9b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_15f2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_1474_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2749_l2682_DUPLICATE_00bc_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_right := to_unsigned(8, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_7a6b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_7a6b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_e038 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_e038;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_3b3b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_3b3b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_3f9f := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_3f9f;
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_70e6 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_70e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_right := to_unsigned(10, 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_9325 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_9325;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_169d := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_169d;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_1c08 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_1c08;
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_899b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_899b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_c9d5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_c9d5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_b967 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_b967;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_87d7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_87d7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_27b8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_27b8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_3739 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_3739;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_5d9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_97e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_1b4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_ff2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_1664] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_left;
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output := BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_15f2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_15f2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_cd65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_left;
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output := BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2686_c6_2211] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_left;
     BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output := BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2720_c30_a7ac] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_ins;
     sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_x;
     sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_return_output := sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_1474 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_1474_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_85ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_1fbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2743_c7_e9b9] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_e9b9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_52a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_c689] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_247f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_2211_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1b4a_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_52a0_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_cd65_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_1664_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_85ca_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_c689_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5d9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_1fbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_ff2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_97e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_247f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_15f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_15f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_15f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_15f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_15f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2725_DUPLICATE_15f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_l2725_l2718_DUPLICATE_029f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_1474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_1474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_1474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_1474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_1474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2714_l2710_l2706_l2702_l2699_l2718_DUPLICATE_1474_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2714_l2743_l2710_l2706_l2702_l2699_l2686_DUPLICATE_4001_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_e9b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_a7ac_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2714_c7_2e44] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond;
     n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output := n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_a09a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_e9b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2725_c7_de14] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_cond;
     l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_return_output := l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2710_c7_362a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond;
     n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output := n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_e9b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2718_c7_a09a] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_cond;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output := l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2743_c7_e9b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2725_c7_de14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_e9b9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2718_c7_a09a] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_cond;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output := l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_7663] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_7663] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2714_c7_2e44] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2710_c7_362a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond;
     n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output := n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_a09a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2714_c7_2e44] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_cond;
     l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output := l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2739_c7_7663] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_return_output := result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7663_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7663_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2714_c7_2e44] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_cond;
     l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output := l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2714_c7_2e44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_9ae1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_9ae1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2710_c7_362a] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_cond;
     l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output := l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_9ae1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c7_362a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_9ae1_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c7_362a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_80bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_80bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2710_c7_362a] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_cond;
     l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output := l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_80bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_80bc_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2725_c7_de14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2725_c7_de14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2725_c7_de14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_return_output := result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_de14_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_a09a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_a09a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_a09a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a09a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2714_c7_2e44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2714_c7_2e44] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output := result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2714_c7_2e44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_2e44_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2710_c7_362a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c7_362a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c7_362a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_362a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2706_c7_9b1e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_9b1e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c7_177f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_177f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2699_c7_9843] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_9843_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2686_c2_c5f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2749_l2682_DUPLICATE_00bc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2749_l2682_DUPLICATE_00bc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_c5f7_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2749_l2682_DUPLICATE_00bc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2749_l2682_DUPLICATE_00bc_return_output;
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
