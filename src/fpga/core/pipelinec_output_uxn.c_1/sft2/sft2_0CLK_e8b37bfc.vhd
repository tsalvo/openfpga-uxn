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
-- Submodules: 64
entity sft2_0CLK_e8b37bfc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_e8b37bfc;
architecture arch of sft2_0CLK_e8b37bfc is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2274_c6_1074]
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal t8_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal n16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2274_c2_acfb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_0eff]
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2287_c7_dc46]
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2287_c7_dc46]
signal t8_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2287_c7_dc46]
signal n16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_dc46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2287_c7_dc46]
signal result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_dc46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_dc46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_dc46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_51ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2290_c7_0e98]
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2290_c7_0e98]
signal t8_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2290_c7_0e98]
signal n16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_0e98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2290_c7_0e98]
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_0e98]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_0e98]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_0e98]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_68b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2294_c7_a01f]
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2294_c7_a01f]
signal n16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_a01f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2294_c7_a01f]
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_a01f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_a01f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_a01f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2296_c3_80ad]
signal CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_7d10]
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2298_c7_2d42]
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2298_c7_2d42]
signal n16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_2d42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_2d42]
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_2d42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_2d42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_2d42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2299_c3_c248]
signal BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2300_c30_3255]
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2301_c20_c8de]
signal BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2301_c12_37ae]
signal BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2301_c36_0309]
signal CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2301_c12_633f]
signal BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2306_c11_c0cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2306_c7_6522]
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2306_c7_6522]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2306_c7_6522]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2306_c7_6522]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2309_c31_48b5]
signal CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_left,
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_right,
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb
tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- t8_MUX_uxn_opcodes_h_l2274_c2_acfb
t8_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
t8_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- n16_MUX_uxn_opcodes_h_l2274_c2_acfb
n16_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
n16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_left,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_right,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46
tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond,
tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue,
tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse,
tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output);

-- t8_MUX_uxn_opcodes_h_l2287_c7_dc46
t8_MUX_uxn_opcodes_h_l2287_c7_dc46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2287_c7_dc46_cond,
t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue,
t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse,
t8_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output);

-- n16_MUX_uxn_opcodes_h_l2287_c7_dc46
n16_MUX_uxn_opcodes_h_l2287_c7_dc46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond,
n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue,
n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse,
n16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_cond,
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98
tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond,
tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue,
tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse,
tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output);

-- t8_MUX_uxn_opcodes_h_l2290_c7_0e98
t8_MUX_uxn_opcodes_h_l2290_c7_0e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2290_c7_0e98_cond,
t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue,
t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse,
t8_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output);

-- n16_MUX_uxn_opcodes_h_l2290_c7_0e98
n16_MUX_uxn_opcodes_h_l2290_c7_0e98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond,
n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue,
n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse,
n16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_cond,
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f
tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond,
tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output);

-- n16_MUX_uxn_opcodes_h_l2294_c7_a01f
n16_MUX_uxn_opcodes_h_l2294_c7_a01f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond,
n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue,
n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse,
n16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad
CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_x,
CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_left,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_right,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42
tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond,
tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue,
tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse,
tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output);

-- n16_MUX_uxn_opcodes_h_l2298_c7_2d42
n16_MUX_uxn_opcodes_h_l2298_c7_2d42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond,
n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue,
n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse,
n16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_cond,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248
BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_left,
BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_right,
BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2300_c30_3255
sp_relative_shift_uxn_opcodes_h_l2300_c30_3255 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_ins,
sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_x,
sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_y,
sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de
BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_left,
BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_right,
BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae
BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_left,
BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_right,
BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2301_c36_0309
CONST_SR_4_uxn_opcodes_h_l2301_c36_0309 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_x,
CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f
BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_left,
BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_right,
BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_cond,
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5
CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_x,
CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output,
 tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 t8_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 n16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output,
 tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output,
 t8_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output,
 n16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output,
 t8_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output,
 n16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output,
 n16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output,
 CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output,
 tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output,
 n16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_return_output,
 sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_return_output,
 CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_return_output,
 CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2279_c3_0a13 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_f26a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_3d0f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_acb5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_f10c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2304_c21_deb1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2307_c3_508c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2308_c3_1168 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2309_c21_9d4c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_fb6f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_eff3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2306_l2294_l2287_l2290_DUPLICATE_9c1b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2294_l2287_l2298_l2290_DUPLICATE_286c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_15b4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_0f36_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2313_l2269_DUPLICATE_3a62_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2307_c3_508c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2307_c3_508c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_3d0f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_3d0f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_right := to_unsigned(15, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_acb5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_acb5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2279_c3_0a13 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2279_c3_0a13;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2308_c3_1168 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2308_c3_1168;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_f10c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_f10c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_f26a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_f26a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse := tmp16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_68b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2306_c11_c0cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_7d10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2274_c6_1074] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_left;
     BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output := BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_15b4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_15b4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_0eff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_eff3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_eff3_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2301_c20_c8de] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_left;
     BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_return_output := BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l2309_c31_48b5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_return_output := CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_fb6f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_fb6f_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2306_l2294_l2287_l2290_DUPLICATE_9c1b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2306_l2294_l2287_l2290_DUPLICATE_9c1b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2294_l2287_l2298_l2290_DUPLICATE_286c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2294_l2287_l2298_l2290_DUPLICATE_286c_return_output := result.is_stack_write;

     -- CONST_SR_4[uxn_opcodes_h_l2301_c36_0309] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_return_output := CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2300_c30_3255] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_ins;
     sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_x;
     sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_return_output := sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_51ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_0f36 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_0f36_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_c8de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1074_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_0eff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_51ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_68b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_7d10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_c0cd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_15b4_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_15b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2306_l2294_l2287_l2290_DUPLICATE_9c1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2306_l2294_l2287_l2290_DUPLICATE_9c1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2306_l2294_l2287_l2290_DUPLICATE_9c1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2306_l2294_l2287_l2290_DUPLICATE_9c1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_eff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_eff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_eff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_eff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_eff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2294_l2287_l2298_l2290_DUPLICATE_286c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2294_l2287_l2298_l2290_DUPLICATE_286c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2294_l2287_l2298_l2290_DUPLICATE_286c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2294_l2287_l2298_l2290_DUPLICATE_286c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_0f36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_0f36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_fb6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_fb6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_fb6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_fb6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_fb6f_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_right := VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_0309_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2274_c2_acfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_3255_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2306_c7_6522] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2306_c7_6522] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2306_c7_6522] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2290_c7_0e98] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2290_c7_0e98_cond <= VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_cond;
     t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue;
     t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output := t8_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_2d42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2296_c3_80ad] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_return_output := CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2309_c21_9d4c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2309_c21_9d4c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_48b5_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2299_c3_c248] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_left;
     BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_return_output := BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_c248_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2309_c21_9d4c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_80ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_6522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_6522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_6522_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_2d42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;

     -- n16_MUX[uxn_opcodes_h_l2298_c7_2d42] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond <= VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond;
     n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue;
     n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output := n16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2301_c12_37ae] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_left;
     BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_return_output := BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_2d42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_2d42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_a01f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2287_c7_dc46] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2287_c7_dc46_cond <= VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_cond;
     t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue;
     t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output := t8_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2306_c7_6522] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_return_output := result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_37ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_6522_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;
     -- n16_MUX[uxn_opcodes_h_l2294_c7_a01f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond;
     n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue;
     n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output := n16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_a01f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2301_c12_633f] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_left;
     BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_return_output := BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_a01f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_a01f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := t8_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_0e98] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_dc46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;

     -- n16_MUX[uxn_opcodes_h_l2290_c7_0e98] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond;
     n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue;
     n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output := n16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2298_c7_2d42] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_cond;
     tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output := tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2304_c21_deb1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2304_c21_deb1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_633f_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_0e98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_0e98] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_0e98] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2304_c21_deb1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_dc46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_2d42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output := result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2294_c7_a01f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_cond;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output := tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2287_c7_dc46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond;
     n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue;
     n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output := n16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_dc46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_dc46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_2d42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2294_c7_a01f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2290_c7_0e98] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_cond;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output := tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := n16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_a01f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2290_c7_0e98] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output := result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2287_c7_dc46] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_cond;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output := tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_0e98_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2287_c7_dc46] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output := result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_dc46_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2274_c2_acfb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2313_l2269_DUPLICATE_3a62 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2313_l2269_DUPLICATE_3a62_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_acfb_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2313_l2269_DUPLICATE_3a62_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2313_l2269_DUPLICATE_3a62_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
