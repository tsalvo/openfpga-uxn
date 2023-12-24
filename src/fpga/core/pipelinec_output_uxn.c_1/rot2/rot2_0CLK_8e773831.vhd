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
-- BIN_OP_EQ[uxn_opcodes_h_l2702_c6_836b]
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2702_c2_4d72]
signal t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_0972]
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2715_c7_e5b6]
signal t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_350c]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2718_c7_8676]
signal n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_8676]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_8676]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_8676]
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_8676]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_8676]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2718_c7_8676]
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2718_c7_8676]
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2718_c7_8676]
signal t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2718_c7_8676]
signal n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2718_c7_8676]
signal t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_e275]
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2722_c7_cc4c]
signal n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_ce07]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2726_c7_1203]
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2726_c7_1203]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2726_c7_1203]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2726_c7_1203]
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2726_c7_1203]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2726_c7_1203]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2726_c7_1203]
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2726_c7_1203]
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2726_c7_1203]
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_9712]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_5200]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2730_c7_5200]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_5200]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_5200]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2730_c7_5200]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2730_c7_5200]
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2730_c7_5200]
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2730_c7_5200]
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_c3a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_8aee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2734_c7_8aee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_8aee]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_8aee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2734_c7_8aee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2734_c7_8aee]
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2734_c7_8aee]
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2736_c30_34f1]
signal sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_a1fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2741_c7_0fc1]
signal result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2741_c7_0fc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2741_c7_0fc1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2741_c7_0fc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : unsigned(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2741_c7_0fc1]
signal l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_36a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2747_c7_6aab]
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2747_c7_6aab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2747_c7_6aab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_0fe0]
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2751_c7_2da1]
signal result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2751_c7_2da1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2751_c7_2da1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_c061]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_81af]
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_81af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_81af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_c316]
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2759_c7_87f4]
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2759_c7_87f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2759_c7_87f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output : unsigned(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b
BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_left,
BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_right,
BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72
n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72
l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72
l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72
t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72
n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72
t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond,
t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue,
t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse,
t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_left,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_right,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6
n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6
l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6
l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6
t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6
n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6
t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond,
t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue,
t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse,
t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2718_c7_8676
n16_high_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2718_c7_8676
l16_low_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2718_c7_8676
l16_high_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2718_c7_8676
t16_low_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2718_c7_8676
n16_low_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2718_c7_8676
t16_high_MUX_uxn_opcodes_h_l2718_c7_8676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond,
t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue,
t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse,
t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_left,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_right,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c
n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c
l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c
l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c
t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c
n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond,
n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2726_c7_1203
n16_high_MUX_uxn_opcodes_h_l2726_c7_1203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond,
n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue,
n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse,
n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_cond,
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2726_c7_1203
l16_low_MUX_uxn_opcodes_h_l2726_c7_1203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond,
l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue,
l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse,
l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2726_c7_1203
l16_high_MUX_uxn_opcodes_h_l2726_c7_1203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond,
l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue,
l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse,
l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2726_c7_1203
n16_low_MUX_uxn_opcodes_h_l2726_c7_1203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond,
n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue,
n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse,
n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2730_c7_5200
l16_low_MUX_uxn_opcodes_h_l2730_c7_5200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond,
l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue,
l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse,
l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2730_c7_5200
l16_high_MUX_uxn_opcodes_h_l2730_c7_5200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_cond,
l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue,
l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse,
l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2730_c7_5200
n16_low_MUX_uxn_opcodes_h_l2730_c7_5200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond,
n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue,
n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse,
n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee
l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_cond,
l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue,
l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse,
l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee
l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_cond,
l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue,
l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse,
l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1
sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_ins,
sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_x,
sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_y,
sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1
l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond,
l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue,
l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse,
l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_left,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_right,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_cond,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_left,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_right,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output,
 n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output,
 n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output,
 n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output,
 n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_return_output,
 l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output,
 l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output,
 n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_return_output,
 l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output,
 l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_return_output,
 n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output,
 l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output,
 l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output,
 sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output,
 l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2707_c3_e03e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_4f5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_953b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_f64a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_875b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_e56b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_f364 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2738_c3_b529 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2743_c3_998e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_1f03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2748_c3_810b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_673c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_eb24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_5816 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2759_c7_87f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2715_l2741_l2730_l2726_l2722_l2718_DUPLICATE_da39_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2715_l2734_l2730_l2726_l2722_l2718_DUPLICATE_cda2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2765_l2698_DUPLICATE_3cda_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_right := to_unsigned(7, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2707_c3_e03e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2707_c3_e03e;
     VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_673c := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_673c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_1f03 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_1f03;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_4f5b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_4f5b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_5816 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_5816;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_f364 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_f364;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_953b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_953b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_f64a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_f64a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2738_c3_b529 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2738_c3_b529;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_eb24 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_eb24;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2748_c3_810b := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2748_c3_810b;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_e56b := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_e56b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2743_c3_998e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2743_c3_998e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_875b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_875b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := t16_low;
     -- sp_relative_shift[uxn_opcodes_h_l2736_c30_34f1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_ins;
     sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_x;
     sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_return_output := sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2759_c7_87f4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2759_c7_87f4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_a1fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_c316] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_left;
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_return_output := BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2715_l2741_l2730_l2726_l2722_l2718_DUPLICATE_da39 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2715_l2741_l2730_l2726_l2722_l2718_DUPLICATE_da39_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_9712] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_36a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_350c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_0fe0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2702_c6_836b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_0972] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_left;
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output := BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_c3a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_ce07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_e275] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_left;
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output := BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2715_l2734_l2730_l2726_l2722_l2718_DUPLICATE_cda2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2715_l2734_l2730_l2726_l2722_l2718_DUPLICATE_cda2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_c061] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_836b_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_0972_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_350c_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_e275_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_ce07_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_9712_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c3a8_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_a1fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_36a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_0fe0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c061_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_c316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2715_l2741_l2730_l2726_l2722_l2718_DUPLICATE_da39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2715_l2741_l2730_l2726_l2722_l2718_DUPLICATE_da39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2715_l2741_l2730_l2726_l2722_l2718_DUPLICATE_da39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2715_l2741_l2730_l2726_l2722_l2718_DUPLICATE_da39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2715_l2741_l2730_l2726_l2722_l2718_DUPLICATE_da39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2715_l2741_l2730_l2726_l2722_l2718_DUPLICATE_da39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2715_l2741_l2734_l2730_l2759_l2726_l2755_l2722_l2751_l2718_l2747_DUPLICATE_c31e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2715_l2734_l2730_l2726_l2722_l2718_DUPLICATE_cda2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2715_l2734_l2730_l2726_l2722_l2718_DUPLICATE_cda2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2715_l2734_l2730_l2726_l2722_l2718_DUPLICATE_cda2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2715_l2734_l2730_l2726_l2722_l2718_DUPLICATE_cda2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2715_l2734_l2730_l2726_l2722_l2718_DUPLICATE_cda2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2715_l2734_l2730_l2726_l2722_l2718_DUPLICATE_cda2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2715_l2702_l2730_l2759_l2726_l2722_l2718_DUPLICATE_950b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2702_c2_4d72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2759_c7_87f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_34f1_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2759_c7_87f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2730_c7_5200] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond;
     n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output := n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2741_c7_0fc1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2734_c7_8aee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2759_c7_87f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2726_c7_1203] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond;
     n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output := n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2741_c7_0fc1] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond;
     l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output := l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2734_c7_8aee] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_cond;
     l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output := l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2759_c7_87f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_87f4_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_81af] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_return_output := result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_81af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_81af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2726_c7_1203] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond;
     n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output := n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2734_c7_8aee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2730_c7_5200] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2730_c7_5200] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_cond;
     l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_return_output := l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2734_c7_8aee] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_cond;
     l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output := l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_81af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_81af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_81af_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2730_c7_5200] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2726_c7_1203] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_cond;
     l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output := l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2751_c7_2da1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2751_c7_2da1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2751_c7_2da1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2726_c7_1203] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2730_c7_5200] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_cond;
     l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output := l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_2da1_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2747_c7_6aab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2747_c7_6aab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2726_c7_1203] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2726_c7_1203] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_cond;
     l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output := l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2747_c7_6aab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_6aab_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2741_c7_0fc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2741_c7_0fc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2741_c7_0fc1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_0fc1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_8aee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_8aee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_8aee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8aee_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_5200] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_5200] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_5200] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_5200_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2726_c7_1203] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_return_output := result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2726_c7_1203] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2726_c7_1203] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_1203_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2722_c7_cc4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_cc4c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_8676] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_8676_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2715_c7_e5b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_e5b6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c2_4d72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2765_l2698_DUPLICATE_3cda LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2765_l2698_DUPLICATE_3cda_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_4d72_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2765_l2698_DUPLICATE_3cda_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2765_l2698_DUPLICATE_3cda_return_output;
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
