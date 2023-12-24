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
-- Submodules: 73
entity div2_0CLK_7cf9dac2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_7cf9dac2;
architecture arch of div2_0CLK_7cf9dac2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_5db4]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2090_c2_d7d5]
signal t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_2258]
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_e495]
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_e495]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_e495]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_e495]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_e495]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2103_c7_e495]
signal n16_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2103_c7_e495]
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2103_c7_e495]
signal t16_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_3d4b]
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_11fb]
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_11fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_11fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_11fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_11fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2106_c7_11fb]
signal n16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2106_c7_11fb]
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2106_c7_11fb]
signal t16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_0616]
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_fb72]
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_fb72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_fb72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_fb72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_fb72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2111_c7_fb72]
signal n16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2111_c7_fb72]
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2111_c7_fb72]
signal t16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2112_c3_e096]
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_a7cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_5e10]
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_5e10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_5e10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_5e10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_5e10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2115_c7_5e10]
signal n16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2115_c7_5e10]
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_44c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_5a24]
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_5a24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_5a24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_5a24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_5a24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2119_c7_5a24]
signal n16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2119_c7_5a24]
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2120_c3_2a71]
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_0b04]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_a43b]
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2121_c11_77a2]
signal MUX_uxn_opcodes_h_l2121_c11_77a2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_77a2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_77a2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_77a2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2122_c30_8cea]
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_67c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_5d11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_5d11]
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_5d11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_5d11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2130_c31_1153]
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- n16_MUX_uxn_opcodes_h_l2090_c2_d7d5
n16_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5
tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- t16_MUX_uxn_opcodes_h_l2090_c2_d7d5
t16_MUX_uxn_opcodes_h_l2090_c2_d7d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond,
t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue,
t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse,
t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_left,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_right,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_cond,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_return_output);

-- n16_MUX_uxn_opcodes_h_l2103_c7_e495
n16_MUX_uxn_opcodes_h_l2103_c7_e495 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2103_c7_e495_cond,
n16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue,
n16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse,
n16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2103_c7_e495
tmp16_MUX_uxn_opcodes_h_l2103_c7_e495 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_cond,
tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue,
tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse,
tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output);

-- t16_MUX_uxn_opcodes_h_l2103_c7_e495
t16_MUX_uxn_opcodes_h_l2103_c7_e495 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2103_c7_e495_cond,
t16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue,
t16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse,
t16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_left,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_right,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output);

-- n16_MUX_uxn_opcodes_h_l2106_c7_11fb
n16_MUX_uxn_opcodes_h_l2106_c7_11fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond,
n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue,
n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse,
n16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb
tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond,
tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output);

-- t16_MUX_uxn_opcodes_h_l2106_c7_11fb
t16_MUX_uxn_opcodes_h_l2106_c7_11fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond,
t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue,
t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse,
t16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_left,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_right,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_cond,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output);

-- n16_MUX_uxn_opcodes_h_l2111_c7_fb72
n16_MUX_uxn_opcodes_h_l2111_c7_fb72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond,
n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue,
n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse,
n16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72
tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond,
tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue,
tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse,
tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output);

-- t16_MUX_uxn_opcodes_h_l2111_c7_fb72
t16_MUX_uxn_opcodes_h_l2111_c7_fb72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond,
t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue,
t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse,
t16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096
BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_left,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_right,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_cond,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output);

-- n16_MUX_uxn_opcodes_h_l2115_c7_5e10
n16_MUX_uxn_opcodes_h_l2115_c7_5e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond,
n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue,
n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse,
n16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10
tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond,
tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue,
tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse,
tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_cond,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output);

-- n16_MUX_uxn_opcodes_h_l2119_c7_5a24
n16_MUX_uxn_opcodes_h_l2119_c7_5a24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond,
n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue,
n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse,
n16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24
tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond,
tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue,
tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse,
tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71
BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_left,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_right,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_left,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_right,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_return_output);

-- MUX_uxn_opcodes_h_l2121_c11_77a2
MUX_uxn_opcodes_h_l2121_c11_77a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2121_c11_77a2_cond,
MUX_uxn_opcodes_h_l2121_c11_77a2_iftrue,
MUX_uxn_opcodes_h_l2121_c11_77a2_iffalse,
MUX_uxn_opcodes_h_l2121_c11_77a2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea
sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_ins,
sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_x,
sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_y,
sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_cond,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2130_c31_1153
CONST_SR_8_uxn_opcodes_h_l2130_c31_1153 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_x,
CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_return_output,
 n16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output,
 tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output,
 t16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output,
 n16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output,
 t16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output,
 n16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output,
 tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output,
 t16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output,
 n16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output,
 tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output,
 n16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output,
 tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_return_output,
 MUX_uxn_opcodes_h_l2121_c11_77a2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output,
 CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_1b5a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_d870 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_c0e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_4f95 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_4d7e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_a2b8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_5a0c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_b301 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_d132 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_792e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_0e68_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_8898_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_5b6a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_402c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_bd0b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2115_l2127_DUPLICATE_4194_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2086_l2134_DUPLICATE_f763_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_a2b8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_a2b8;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_d132 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_d132;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_4f95 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_4f95;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_d870 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_d870;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_4d7e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_4d7e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_c0e4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_c0e4;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_b301 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_b301;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_1b5a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_1b5a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_bd0b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_bd0b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_0e68 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_0e68_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_5b6a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_5b6a_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_5db4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2122_c30_8cea] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_ins;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_x;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_return_output := sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2115_l2127_DUPLICATE_4194 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2115_l2127_DUPLICATE_4194_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2130_c31_1153] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_return_output := CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_8898 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_8898_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_a7cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_3d4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_2258] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_left;
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output := BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_67c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_44c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_402c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_402c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_0616] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_left;
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output := BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_0b04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_5db4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_2258_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3d4b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0616_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_a7cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_44c2_return_output;
     VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_0b04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_67c5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_bd0b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_bd0b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_bd0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_8898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_8898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_8898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_8898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_8898_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_5b6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_5b6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_5b6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_5b6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_5b6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_5b6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_402c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_402c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_402c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_402c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_402c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2115_l2127_DUPLICATE_4194_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2115_l2127_DUPLICATE_4194_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_0e68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_0e68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_0e68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_0e68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_0e68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_0e68_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_d7d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_8cea_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2120_c3_2a71] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_left;
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_return_output := BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2112_c3_e096] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_left;
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_return_output := BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_5a24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_5d11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_5d11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2130_c21_792e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_792e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_1153_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_5d11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_e096_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2a71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_792e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_4350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_5e10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_5a24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_5a24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;

     -- t16_MUX[uxn_opcodes_h_l2111_c7_fb72] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond;
     t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue;
     t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output := t16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_a43b] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_left;
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_return_output := BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2119_c7_5a24] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond;
     n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue;
     n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output := n16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_5d11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output := result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_5a24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a43b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_5d11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;
     -- n16_MUX[uxn_opcodes_h_l2115_c7_5e10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond;
     n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue;
     n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output := n16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;

     -- MUX[uxn_opcodes_h_l2121_c11_77a2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2121_c11_77a2_cond <= VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_cond;
     MUX_uxn_opcodes_h_l2121_c11_77a2_iftrue <= VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_iftrue;
     MUX_uxn_opcodes_h_l2121_c11_77a2_iffalse <= VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_return_output := MUX_uxn_opcodes_h_l2121_c11_77a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_5e10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;

     -- t16_MUX[uxn_opcodes_h_l2106_c7_11fb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond;
     t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue;
     t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output := t16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_fb72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_5e10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_5e10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue := VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;
     -- n16_MUX[uxn_opcodes_h_l2111_c7_fb72] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond;
     n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue;
     n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output := n16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2125_c21_5a0c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_5a0c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2121_c11_77a2_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_fb72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_fb72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;

     -- t16_MUX[uxn_opcodes_h_l2103_c7_e495] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2103_c7_e495_cond <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_cond;
     t16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue;
     t16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output := t16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_fb72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2119_c7_5a24] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_cond;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output := tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_11fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_5a0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_5a24] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output := result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_e495] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_11fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2115_c7_5e10] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_cond;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output := tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;

     -- t16_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2106_c7_11fb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond;
     n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue;
     n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output := n16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_11fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_11fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5a24_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_5e10] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output := result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;

     -- n16_MUX[uxn_opcodes_h_l2103_c7_e495] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2103_c7_e495_cond <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_cond;
     n16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue;
     n16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output := n16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_e495] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2111_c7_fb72] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_cond;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output := tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_e495] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_e495] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_5e10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_fb72] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output := result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;

     -- n16_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2106_c7_11fb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_cond;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output := tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_fb72_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2103_c7_e495] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_cond;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output := tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_11fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_11fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_e495] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_return_output := result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_e495_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_d7d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2086_l2134_DUPLICATE_f763 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2086_l2134_DUPLICATE_f763_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_d7d5_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2086_l2134_DUPLICATE_f763_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2086_l2134_DUPLICATE_f763_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
