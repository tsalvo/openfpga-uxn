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
entity sta2_0CLK_4674db74 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_4674db74;
architecture arch of sta2_0CLK_4674db74 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_540c]
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2339_c2_a52c]
signal t16_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_9db5]
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2352_c7_4d7b]
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2352_c7_4d7b]
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_4d7b]
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_4d7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_4d7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_4d7b]
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_4d7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_4d7b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2352_c7_4d7b]
signal t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_2d90]
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2355_c7_28ee]
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2355_c7_28ee]
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_28ee]
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_28ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_28ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_28ee]
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_28ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_28ee]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2355_c7_28ee]
signal t16_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2357_c3_cb63]
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_ca72]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2360_c7_2e98]
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2360_c7_2e98]
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_2e98]
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_2e98]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_2e98]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_2e98]
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_2e98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_2e98]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2360_c7_2e98]
signal t16_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2361_c3_f9b7]
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_f61c]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2364_c7_b0d6]
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2364_c7_b0d6]
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_b0d6]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_b0d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_b0d6]
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_b0d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_b0d6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2366_c30_33c7]
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_f6bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2371_c7_60b0]
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_60b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_60b0]
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_60b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_60b0]
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_d3bd]
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e482( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_left,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_right,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c
n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c
n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- t16_MUX_uxn_opcodes_h_l2339_c2_a52c
t16_MUX_uxn_opcodes_h_l2339_c2_a52c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2339_c2_a52c_cond,
t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue,
t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse,
t16_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_left,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_right,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b
n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond,
n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue,
n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse,
n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b
n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond,
n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue,
n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse,
n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output);

-- t16_MUX_uxn_opcodes_h_l2352_c7_4d7b
t16_MUX_uxn_opcodes_h_l2352_c7_4d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond,
t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue,
t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse,
t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_left,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_right,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee
n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_cond,
n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue,
n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse,
n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee
n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_cond,
n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue,
n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse,
n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output);

-- t16_MUX_uxn_opcodes_h_l2355_c7_28ee
t16_MUX_uxn_opcodes_h_l2355_c7_28ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2355_c7_28ee_cond,
t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue,
t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse,
t16_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63
CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_x,
CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98
n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_cond,
n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue,
n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse,
n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98
n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_cond,
n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue,
n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse,
n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output);

-- t16_MUX_uxn_opcodes_h_l2360_c7_2e98
t16_MUX_uxn_opcodes_h_l2360_c7_2e98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2360_c7_2e98_cond,
t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue,
t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse,
t16_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7
BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_left,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_right,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6
n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond,
n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue,
n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse,
n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6
n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond,
n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue,
n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse,
n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7
sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_ins,
sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_x,
sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_y,
sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0
n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_cond,
n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue,
n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse,
n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_left,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_right,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 n16_high,
 n16_low,
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 t16_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output,
 n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output,
 n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output,
 t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output,
 n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output,
 n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output,
 t16_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output,
 CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output,
 n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output,
 n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output,
 t16_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output,
 n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output,
 sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output,
 n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_dc12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_796c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_f483 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_25c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_0a13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_2e98_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_a43d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2374_c3_c7da : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_ca13_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_8a35_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2355_l2371_l2360_l2352_DUPLICATE_798e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_cfcc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2355_l2360_l2352_l2364_DUPLICATE_d8f4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_2266_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l2379_l2334_DUPLICATE_e747_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_796c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_796c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_25c4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_25c4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_0a13 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_0a13;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_f483 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_f483;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_dc12 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_dc12;
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_y := to_signed(-4, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_a43d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_a43d;
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse := t16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_d3bd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2366_c30_33c7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_ins;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_x;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_return_output := sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2355_l2360_l2352_l2364_DUPLICATE_d8f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2355_l2360_l2352_l2364_DUPLICATE_d8f4_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_9db5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_2266 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_2266_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_ca13 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_ca13_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_8a35 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_8a35_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_cfcc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_cfcc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_540c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_f61c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_2e98_return_output := result.stack_address_sp_offset;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_2d90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_left;
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output := BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_f6bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_ca72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2355_l2371_l2360_l2352_DUPLICATE_798e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2355_l2371_l2360_l2352_DUPLICATE_798e_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_540c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9db5_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_2d90_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_ca72_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f61c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_f6bf_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2374_c3_c7da := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_d3bd_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_2266_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_2266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2355_l2371_l2360_l2352_DUPLICATE_798e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2355_l2371_l2360_l2352_DUPLICATE_798e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2355_l2371_l2360_l2352_DUPLICATE_798e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2355_l2371_l2360_l2352_DUPLICATE_798e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_8a35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_8a35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_8a35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_8a35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_8a35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_cfcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_cfcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_cfcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_cfcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2371_l2364_l2360_l2355_l2352_DUPLICATE_cfcc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2355_l2360_l2352_l2364_DUPLICATE_d8f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2355_l2360_l2352_l2364_DUPLICATE_d8f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2355_l2360_l2352_l2364_DUPLICATE_d8f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2355_l2360_l2352_l2364_DUPLICATE_d8f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_ca13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_ca13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_ca13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_ca13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2371_l2360_l2355_l2352_l2339_DUPLICATE_ca13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_a52c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_2e98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_33c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2374_c3_c7da;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_60b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_60b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_b0d6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2361_c3_f9b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_left;
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_return_output := BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2357_c3_cb63] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_return_output := CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2371_c7_60b0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_cond;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output := n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_60b0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output := result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2364_c7_b0d6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output := n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_60b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_f9b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_cb63_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_60b0_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_b0d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_cond;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output := n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2364_c7_b0d6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output := n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_b0d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_b0d6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output := result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_b0d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_28ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2360_c7_2e98_cond <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_cond;
     t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue;
     t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output := t16_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_b0d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output := result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_28ee] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2355_c7_28ee] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_cond;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output := n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;

     -- t16_MUX[uxn_opcodes_h_l2355_c7_28ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2355_c7_28ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_cond;
     t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue;
     t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output := t16_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_4d7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output := result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2360_c7_2e98] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_cond;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output := n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_2e98_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2352_c7_4d7b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output := n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_28ee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output := result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2355_c7_28ee] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_cond;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output := n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l2352_c7_4d7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond;
     t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue;
     t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output := t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_4d7b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_28ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_28ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_28ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_28ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_4d7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := t16_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_4d7b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output := result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_4d7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_4d7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2352_c7_4d7b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_cond;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output := n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_4d7b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_a52c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l2379_l2334_DUPLICATE_e747 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l2379_l2334_DUPLICATE_e747_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e482(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_a52c_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l2379_l2334_DUPLICATE_e747_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l2379_l2334_DUPLICATE_e747_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
