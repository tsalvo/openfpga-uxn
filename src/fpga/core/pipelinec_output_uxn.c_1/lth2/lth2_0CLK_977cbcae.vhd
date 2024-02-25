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
-- Submodules: 58
entity lth2_0CLK_977cbcae is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_977cbcae;
architecture arch of lth2_0CLK_977cbcae is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_ba4c]
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1924_c2_5204]
signal t16_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_5204]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_5204]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_5204]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_5204]
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_5204]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_5204]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_5204]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_5204]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_5204]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1924_c2_5204]
signal n16_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_98cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1937_c7_bde1]
signal t16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_bde1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_bde1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_bde1]
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_bde1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_bde1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1937_c7_bde1]
signal n16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_c194]
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1940_c7_d8dd]
signal t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_d8dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_d8dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_d8dd]
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_d8dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_d8dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1940_c7_d8dd]
signal n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_803c]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1945_c7_b2c0]
signal t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_b2c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_b2c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_b2c0]
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_b2c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_b2c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1945_c7_b2c0]
signal n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1946_c3_79b3]
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_2ece]
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_484a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_484a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_484a]
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_484a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_484a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1949_c7_484a]
signal n16_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_1b76]
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_3e06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_3e06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_3e06]
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_3e06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_3e06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1953_c7_3e06]
signal n16_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1954_c3_e417]
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1955_c30_4fe1]
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1958_c21_aac9]
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1958_c21_6a45]
signal MUX_uxn_opcodes_h_l1958_c21_6a45_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_6a45_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_6a45_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_6a45_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_left,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_right,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output);

-- t16_MUX_uxn_opcodes_h_l1924_c2_5204
t16_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
t16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
t16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
t16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- n16_MUX_uxn_opcodes_h_l1924_c2_5204
n16_MUX_uxn_opcodes_h_l1924_c2_5204 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1924_c2_5204_cond,
n16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue,
n16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse,
n16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output);

-- t16_MUX_uxn_opcodes_h_l1937_c7_bde1
t16_MUX_uxn_opcodes_h_l1937_c7_bde1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond,
t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue,
t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse,
t16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output);

-- n16_MUX_uxn_opcodes_h_l1937_c7_bde1
n16_MUX_uxn_opcodes_h_l1937_c7_bde1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond,
n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue,
n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse,
n16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_left,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_right,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output);

-- t16_MUX_uxn_opcodes_h_l1940_c7_d8dd
t16_MUX_uxn_opcodes_h_l1940_c7_d8dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond,
t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue,
t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse,
t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output);

-- n16_MUX_uxn_opcodes_h_l1940_c7_d8dd
n16_MUX_uxn_opcodes_h_l1940_c7_d8dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond,
n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue,
n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse,
n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output);

-- t16_MUX_uxn_opcodes_h_l1945_c7_b2c0
t16_MUX_uxn_opcodes_h_l1945_c7_b2c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond,
t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue,
t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse,
t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output);

-- n16_MUX_uxn_opcodes_h_l1945_c7_b2c0
n16_MUX_uxn_opcodes_h_l1945_c7_b2c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond,
n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue,
n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse,
n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3
BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_left,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_right,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_left,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_right,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_return_output);

-- n16_MUX_uxn_opcodes_h_l1949_c7_484a
n16_MUX_uxn_opcodes_h_l1949_c7_484a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1949_c7_484a_cond,
n16_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue,
n16_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse,
n16_MUX_uxn_opcodes_h_l1949_c7_484a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_left,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_right,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_cond,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output);

-- n16_MUX_uxn_opcodes_h_l1953_c7_3e06
n16_MUX_uxn_opcodes_h_l1953_c7_3e06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1953_c7_3e06_cond,
n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue,
n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse,
n16_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417
BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_left,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_right,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1
sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_ins,
sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_x,
sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_y,
sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9
BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_left,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_right,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_return_output);

-- MUX_uxn_opcodes_h_l1958_c21_6a45
MUX_uxn_opcodes_h_l1958_c21_6a45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1958_c21_6a45_cond,
MUX_uxn_opcodes_h_l1958_c21_6a45_iftrue,
MUX_uxn_opcodes_h_l1958_c21_6a45_iffalse,
MUX_uxn_opcodes_h_l1958_c21_6a45_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output,
 t16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 n16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output,
 t16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output,
 n16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output,
 t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output,
 n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output,
 t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output,
 n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_return_output,
 n16_MUX_uxn_opcodes_h_l1949_c7_484a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output,
 n16_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_return_output,
 sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_return_output,
 MUX_uxn_opcodes_h_l1958_c21_6a45_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_7b58 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_8521 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_430e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_509d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_835c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_75c9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1937_l1924_l1953_l1949_l1945_l1940_DUPLICATE_0717_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_f6ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_a896_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_7c1a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_ca66_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_761b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1920_l1962_DUPLICATE_ad79_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_8521 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_8521;
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_835c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_835c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_75c9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_75c9;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_7b58 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_7b58;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_430e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_430e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_509d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_509d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse := t16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_5204_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_5204_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_761b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_761b_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_5204_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_ba4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_c194] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_left;
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output := BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_98cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_f6ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_f6ab_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_7c1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_7c1a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_803c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_5204_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_1b76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_a896 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_a896_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1937_l1924_l1953_l1949_l1945_l1940_DUPLICATE_0717 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1937_l1924_l1953_l1949_l1945_l1940_DUPLICATE_0717_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_2ece] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_left;
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output := BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_ca66 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_ca66_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1955_c30_4fe1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_ins;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_x;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_return_output := sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ba4c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_98cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_c194_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_803c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2ece_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_1b76_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_ca66_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_ca66_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_ca66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_a896_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_a896_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_a896_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_a896_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_a896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_7c1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_7c1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_7c1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_7c1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_7c1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_f6ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_f6ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_f6ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_f6ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1937_l1953_l1949_l1945_l1940_DUPLICATE_f6ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_761b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_761b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1937_l1924_l1953_l1949_l1945_l1940_DUPLICATE_0717_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1937_l1924_l1953_l1949_l1945_l1940_DUPLICATE_0717_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1937_l1924_l1953_l1949_l1945_l1940_DUPLICATE_0717_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1937_l1924_l1953_l1949_l1945_l1940_DUPLICATE_0717_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1937_l1924_l1953_l1949_l1945_l1940_DUPLICATE_0717_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1937_l1924_l1953_l1949_l1945_l1940_DUPLICATE_0717_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_5204_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_5204_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_5204_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_5204_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_4fe1_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1946_c3_79b3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_left;
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_return_output := BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_3e06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_3e06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1954_c3_e417] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_left;
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_return_output := BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_3e06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_3e06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_79b3_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_e417_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_8c27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_484a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1945_c7_b2c0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond;
     t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue;
     t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output := t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_484a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1958_c21_aac9] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_left;
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_return_output := BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_484a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1953_c7_3e06] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1953_c7_3e06_cond <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_cond;
     n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue;
     n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output := n16_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_484a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_aac9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_b2c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_b2c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1940_c7_d8dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond;
     t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue;
     t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output := t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_b2c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_b2c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;

     -- MUX[uxn_opcodes_h_l1958_c21_6a45] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1958_c21_6a45_cond <= VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_cond;
     MUX_uxn_opcodes_h_l1958_c21_6a45_iftrue <= VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_iftrue;
     MUX_uxn_opcodes_h_l1958_c21_6a45_iffalse <= VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_return_output := MUX_uxn_opcodes_h_l1958_c21_6a45_return_output;

     -- n16_MUX[uxn_opcodes_h_l1949_c7_484a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1949_c7_484a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_cond;
     n16_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue;
     n16_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_return_output := n16_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue := VAR_MUX_uxn_opcodes_h_l1958_c21_6a45_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_3e06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output := result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;

     -- t16_MUX[uxn_opcodes_h_l1937_c7_bde1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond;
     t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue;
     t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output := t16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_d8dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_d8dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_d8dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1945_c7_b2c0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond;
     n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue;
     n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output := n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_d8dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_3e06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;
     -- t16_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     t16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     t16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := t16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- n16_MUX[uxn_opcodes_h_l1940_c7_d8dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond;
     n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue;
     n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output := n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_bde1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_bde1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_484a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_bde1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_bde1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_484a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_b2c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- n16_MUX[uxn_opcodes_h_l1937_c7_bde1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_cond;
     n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue;
     n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output := n16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_b2c0_return_output;
     -- n16_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     n16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     n16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := n16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_d8dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_d8dd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_bde1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_bde1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_5204] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_return_output := result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1920_l1962_DUPLICATE_ad79 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1920_l1962_DUPLICATE_ad79_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_5204_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_5204_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1920_l1962_DUPLICATE_ad79_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1920_l1962_DUPLICATE_ad79_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
