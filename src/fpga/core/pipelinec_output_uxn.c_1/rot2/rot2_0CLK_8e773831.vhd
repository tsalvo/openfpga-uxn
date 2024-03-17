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
-- BIN_OP_EQ[uxn_opcodes_h_l2686_c6_67fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2686_c2_4e77]
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_8d87]
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2699_c7_1c7d]
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_49c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2702_c7_2727]
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2702_c7_2727]
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c7_2727]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c7_2727]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c7_2727]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c7_2727]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2702_c7_2727]
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2702_c7_2727]
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2702_c7_2727]
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2702_c7_2727]
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2702_c7_2727]
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_5250]
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2706_c7_aa81]
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_85ba]
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2710_c7_3c71]
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c7_3c71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c7_3c71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c7_3c71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c7_3c71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2710_c7_3c71]
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2710_c7_3c71]
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2710_c7_3c71]
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2710_c7_3c71]
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_6a47]
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2714_c7_7ac2]
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2714_c7_7ac2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2714_c7_7ac2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2714_c7_7ac2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2714_c7_7ac2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2714_c7_7ac2]
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2714_c7_7ac2]
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2714_c7_7ac2]
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_cf22]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_7fcc]
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_7fcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_7fcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_7fcc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_7fcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2718_c7_7fcc]
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2718_c7_7fcc]
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2720_c30_ab16]
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_7cac]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2725_c7_845a]
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2725_c7_845a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2725_c7_845a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2725_c7_845a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2725_c7_845a]
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_c296]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_cc08]
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_cc08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_cc08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_68b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_475e]
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_475e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_475e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_9ec4]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2739_c7_7b6c]
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_7b6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_7b6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_53e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2743_c7_763d]
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_763d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_763d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77
t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77
n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77
n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77
l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77
t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77
l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond,
l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue,
l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse,
l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_left,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_right,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d
t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d
n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d
n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d
l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d
t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d
l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond,
l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue,
l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse,
l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2702_c7_2727
t16_high_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2702_c7_2727
n16_low_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2702_c7_2727
n16_high_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2702_c7_2727
l16_low_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2702_c7_2727
t16_low_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2702_c7_2727
l16_high_MUX_uxn_opcodes_h_l2702_c7_2727 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond,
l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue,
l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse,
l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_left,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_right,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81
n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81
n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81
l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81
t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81
l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond,
l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue,
l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse,
l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_left,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_right,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_cond,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71
n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond,
n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue,
n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse,
n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71
n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond,
n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue,
n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse,
n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71
l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond,
l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue,
l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse,
l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71
l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond,
l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue,
l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse,
l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_left,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_right,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2
n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond,
n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue,
n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse,
n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2
l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond,
l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue,
l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse,
l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2
l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond,
l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue,
l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse,
l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc
l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond,
l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue,
l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse,
l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc
l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond,
l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue,
l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse,
l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16
sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_ins,
sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_x,
sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_y,
sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2725_c7_845a
l16_low_MUX_uxn_opcodes_h_l2725_c7_845a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_cond,
l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue,
l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse,
l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_cond,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output,
 t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output,
 t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output,
 t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output,
 n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output,
 n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output,
 l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output,
 l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output,
 n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output,
 l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output,
 l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output,
 l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output,
 l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output,
 sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_return_output,
 l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_7425 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_3e4b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_3bb5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_fbf3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_b8b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_d42a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_8717 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_b28b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_99a7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_54bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_b4c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_a45e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_f3d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_1376 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_763d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2718_l2714_l2710_l2706_l2702_l2699_DUPLICATE_4901_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2725_l2714_l2710_l2706_l2702_l2699_DUPLICATE_6ebb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2749_l2682_DUPLICATE_40cc_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_b28b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_b28b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_3e4b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_3e4b;
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_d42a := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_d42a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_b4c2 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_b4c2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_54bc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_54bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_7425 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_7425;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_1376 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_1376;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_a45e := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_a45e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_fbf3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_fbf3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_3bb5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_3bb5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_f3d3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_f3d3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_b8b3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_b8b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_99a7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_99a7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_8717 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_8717;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := t16_low;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2725_l2714_l2710_l2706_l2702_l2699_DUPLICATE_6ebb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2725_l2714_l2710_l2706_l2702_l2699_DUPLICATE_6ebb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_6a47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_left;
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output := BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_cf22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_68b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_8d87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_left;
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output := BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_53e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_5250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_left;
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output := BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_c296] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2686_c6_67fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2718_l2714_l2710_l2706_l2702_l2699_DUPLICATE_4901 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2718_l2714_l2710_l2706_l2702_l2699_DUPLICATE_4901_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_9ec4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_85ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_49c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_7cac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2743_c7_763d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_763d_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2720_c30_ab16] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_ins;
     sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_x;
     sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_return_output := sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_return_output;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_67fe_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_8d87_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_49c9_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_5250_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_85ba_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_6a47_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_cf22_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_7cac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_c296_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_68b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_9ec4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_53e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2725_l2714_l2710_l2706_l2702_l2699_DUPLICATE_6ebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2725_l2714_l2710_l2706_l2702_l2699_DUPLICATE_6ebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2725_l2714_l2710_l2706_l2702_l2699_DUPLICATE_6ebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2725_l2714_l2710_l2706_l2702_l2699_DUPLICATE_6ebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2725_l2714_l2710_l2706_l2702_l2699_DUPLICATE_6ebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2725_l2714_l2710_l2706_l2702_l2699_DUPLICATE_6ebb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2725_l2718_l2714_l2743_l2710_l2739_l2706_l2735_l2702_l2731_l2699_DUPLICATE_4ce9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2718_l2714_l2710_l2706_l2702_l2699_DUPLICATE_4901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2718_l2714_l2710_l2706_l2702_l2699_DUPLICATE_4901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2718_l2714_l2710_l2706_l2702_l2699_DUPLICATE_4901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2718_l2714_l2710_l2706_l2702_l2699_DUPLICATE_4901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2718_l2714_l2710_l2706_l2702_l2699_DUPLICATE_4901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2718_l2714_l2710_l2706_l2702_l2699_DUPLICATE_4901_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2686_l2714_l2743_l2710_l2706_l2702_l2699_DUPLICATE_3260_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_4e77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_763d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_ab16_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_763d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2743_c7_763d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2710_c7_3c71] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond;
     n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output := n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_763d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_7fcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2718_c7_7fcc] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output := l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2725_c7_845a] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_cond;
     l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_return_output := l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2714_c7_7ac2] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond;
     n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output := n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2725_c7_845a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_763d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_763d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_763d_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2718_c7_7fcc] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output := l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2739_c7_7b6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2710_c7_3c71] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond;
     n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output := n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2714_c7_7ac2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_7fcc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_7b6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_7b6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2714_c7_7ac2] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond;
     l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output := l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_7b6c_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2714_c7_7ac2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_475e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_475e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c7_3c71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2710_c7_3c71] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_cond;
     l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output := l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_475e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2714_c7_7ac2] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond;
     l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output := l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_475e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_475e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_475e_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_cc08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2710_c7_3c71] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_cond;
     l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output := l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_cc08] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output := result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_cc08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c7_3c71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_cc08_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2725_c7_845a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2725_c7_845a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2725_c7_845a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_845a_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_7fcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_7fcc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_7fcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_7fcc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2714_c7_7ac2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2714_c7_7ac2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2714_c7_7ac2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_7ac2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c7_3c71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c7_3c71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2710_c7_3c71] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output := result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_3c71_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2706_c7_aa81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output := result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_aa81_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c7_2727] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_2727_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2699_c7_1c7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_1c7d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2686_c2_4e77] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output := result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2749_l2682_DUPLICATE_40cc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2749_l2682_DUPLICATE_40cc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_4e77_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2749_l2682_DUPLICATE_40cc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2749_l2682_DUPLICATE_40cc_return_output;
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
