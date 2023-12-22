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
-- Submodules: 67
entity swp2_0CLK_814c2afd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_814c2afd;
architecture arch of swp2_0CLK_814c2afd is
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
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2603_c6_1122]
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2603_c2_5ec6]
signal n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_198c]
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2616_c7_d26c]
signal t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_d26c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_d26c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_d26c]
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2616_c7_d26c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_d26c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2616_c7_d26c]
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2616_c7_d26c]
signal t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2616_c7_d26c]
signal n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2619_c11_2f7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2619_c7_aa5a]
signal t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2619_c7_aa5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2619_c7_aa5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2619_c7_aa5a]
signal result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2619_c7_aa5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2619_c7_aa5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2619_c7_aa5a]
signal n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2619_c7_aa5a]
signal t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2619_c7_aa5a]
signal n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_80c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_90cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_90cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_90cd]
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2623_c7_90cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2623_c7_90cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2623_c7_90cd]
signal n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2623_c7_90cd]
signal t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2623_c7_90cd]
signal n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_bf4e]
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_329f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_329f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_329f]
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2627_c7_329f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2627_c7_329f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2627_c7_329f]
signal n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2627_c7_329f]
signal n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2629_c30_0120]
signal sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2634_c11_788a]
signal BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2634_c7_119d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2634_c7_119d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2634_c7_119d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2634_c7_119d]
signal result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2634_c7_119d]
signal n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2640_c11_9e45]
signal BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2640_c7_2b62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2640_c7_2b62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2640_c7_2b62]
signal result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2644_c11_bb89]
signal BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2644_c7_aac6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2644_c7_aac6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2644_c7_aac6]
signal result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122
BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_left,
BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_right,
BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6
t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6
result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6
result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6
result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6
result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6
n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6
t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6
n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond,
n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue,
n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse,
n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_left,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_right,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c
t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond,
t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue,
t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse,
t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c
result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c
n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond,
n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c
t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond,
t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue,
t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse,
t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c
n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond,
n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f
BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a
t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond,
t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue,
t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse,
t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a
result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a
result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a
result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a
n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond,
n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue,
n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse,
n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a
t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond,
t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue,
t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse,
t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a
n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond,
n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue,
n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse,
n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd
n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond,
n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue,
n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse,
n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd
t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond,
t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue,
t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse,
t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd
n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_cond,
n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue,
n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse,
n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_left,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_right,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f
result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2627_c7_329f
n16_low_MUX_uxn_opcodes_h_l2627_c7_329f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_cond,
n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2627_c7_329f
n16_high_MUX_uxn_opcodes_h_l2627_c7_329f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_cond,
n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue,
n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse,
n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2629_c30_0120
sp_relative_shift_uxn_opcodes_h_l2629_c30_0120 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_ins,
sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_x,
sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_y,
sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_left,
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_right,
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2634_c7_119d
n16_low_MUX_uxn_opcodes_h_l2634_c7_119d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_cond,
n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45
BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_left,
BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_right,
BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62
result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_cond,
result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_left,
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_right,
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6
result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output,
 t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output,
 t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output,
 t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output,
 t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output,
 n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output,
 t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output,
 n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output,
 n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output,
 t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output,
 n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_return_output,
 n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_7068 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2608_c3_c22b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2617_c3_120b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2621_c3_2c93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2625_c3_df04 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2631_c3_fd36 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2637_c3_6e30 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2636_c3_b352 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2641_c3_538d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2645_c3_8bd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2644_c7_aac6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2603_l2623_l2619_l2616_l2644_DUPLICATE_5666_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2623_l2616_l2627_l2619_DUPLICATE_72ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2623_l2616_l2619_l2634_DUPLICATE_3cfb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2650_l2599_DUPLICATE_09c3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_high := t16_high;
  REG_VAR_t16_low := t16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2636_c3_b352 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2636_c3_b352;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2608_c3_c22b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2608_c3_c22b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2645_c3_8bd2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2645_c3_8bd2;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2617_c3_120b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2617_c3_120b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2641_c3_538d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2641_c3_538d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2637_c3_6e30 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2637_c3_6e30;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2621_c3_2c93 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2621_c3_2c93;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2625_c3_df04 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2625_c3_df04;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2631_c3_fd36 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2631_c3_fd36;
     VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_7068 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_7068;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse := t16_low;
     -- sp_relative_shift[uxn_opcodes_h_l2629_c30_0120] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_ins;
     sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_x;
     sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_return_output := sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2603_l2623_l2619_l2616_l2644_DUPLICATE_5666 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2603_l2623_l2619_l2616_l2644_DUPLICATE_5666_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2634_c11_788a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2644_c7_aac6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2644_c7_aac6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2603_c6_1122] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_left;
     BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output := BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2640_c11_9e45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_left;
     BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_return_output := BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_bf4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2623_l2616_l2619_l2634_DUPLICATE_3cfb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2623_l2616_l2619_l2634_DUPLICATE_3cfb_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2619_c11_2f7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2623_l2616_l2627_l2619_DUPLICATE_72ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2623_l2616_l2627_l2619_DUPLICATE_72ff_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_80c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2644_c11_bb89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_left;
     BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_return_output := BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_198c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_1122_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_198c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2619_c11_2f7f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_80c0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_bf4e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_788a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_9e45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_bb89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2623_l2616_l2619_l2634_DUPLICATE_3cfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2623_l2616_l2619_l2634_DUPLICATE_3cfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2623_l2616_l2619_l2634_DUPLICATE_3cfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2623_l2616_l2619_l2634_DUPLICATE_3cfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2640_l2634_l2627_l2623_l2619_l2616_l2644_DUPLICATE_fe55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2623_l2616_l2627_l2619_DUPLICATE_72ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2623_l2616_l2627_l2619_DUPLICATE_72ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2623_l2616_l2627_l2619_DUPLICATE_72ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2623_l2616_l2627_l2619_DUPLICATE_72ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2603_l2623_l2619_l2616_l2644_DUPLICATE_5666_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2603_l2623_l2619_l2616_l2644_DUPLICATE_5666_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2603_l2623_l2619_l2616_l2644_DUPLICATE_5666_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2603_l2623_l2619_l2616_l2644_DUPLICATE_5666_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2603_l2623_l2619_l2616_l2644_DUPLICATE_5666_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2603_c2_5ec6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2644_c7_aac6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2629_c30_0120_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2627_c7_329f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2644_c7_aac6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2623_c7_90cd] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond;
     t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output := t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2634_c7_119d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_cond;
     n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_return_output := n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2644_c7_aac6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2634_c7_119d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2619_c7_aa5a] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond;
     t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output := t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2644_c7_aac6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2627_c7_329f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_cond;
     n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_return_output := n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2644_c7_aac6_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2627_c7_329f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2640_c7_2b62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2623_c7_90cd] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_cond;
     n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output := n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2627_c7_329f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_cond;
     n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_return_output := n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2640_c7_2b62] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output := result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2619_c7_aa5a] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond;
     t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output := t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2623_c7_90cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2616_c7_d26c] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond;
     t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output := t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2640_c7_2b62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2640_c7_2b62_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2616_c7_d26c] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond;
     t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output := t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2623_c7_90cd] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_cond;
     n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output := n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2634_c7_119d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2634_c7_119d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2619_c7_aa5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2623_c7_90cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2619_c7_aa5a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond;
     n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output := n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2634_c7_119d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2634_c7_119d_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2619_c7_aa5a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond;
     n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output := n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_329f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2616_c7_d26c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_cond;
     n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output := n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2619_c7_aa5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_329f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_329f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2616_c7_d26c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_329f_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_90cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_90cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2616_c7_d26c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_cond;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output := n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_90cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_d26c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_90cd_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2619_c7_aa5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2619_c7_aa5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2619_c7_aa5a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2619_c7_aa5a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_d26c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_d26c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_d26c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_d26c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2603_c2_5ec6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2650_l2599_DUPLICATE_09c3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2650_l2599_DUPLICATE_09c3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2603_c2_5ec6_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2650_l2599_DUPLICATE_09c3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2650_l2599_DUPLICATE_09c3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
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
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
