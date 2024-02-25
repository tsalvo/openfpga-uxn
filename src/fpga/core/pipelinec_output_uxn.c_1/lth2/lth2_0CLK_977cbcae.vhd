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
-- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_a0b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal t16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal n16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_0f56]
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_589a]
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1937_c7_da96]
signal t16_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1937_c7_da96]
signal n16_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_da96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_da96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_da96]
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_da96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_da96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_0da3]
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1940_c7_b576]
signal t16_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1940_c7_b576]
signal n16_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_b576]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_b576]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_b576]
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_b576]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_b576]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_4596]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1945_c7_8d44]
signal t16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1945_c7_8d44]
signal n16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_8d44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_8d44]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_8d44]
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_8d44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_8d44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1946_c3_a876]
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_2e61]
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1949_c7_d9d0]
signal n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_d9d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_d9d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_d9d0]
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_d9d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_d9d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_5753]
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1953_c7_7daa]
signal n16_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_7daa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_7daa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_7daa]
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_7daa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_7daa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1954_c3_37cf]
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1955_c30_ad7e]
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1958_c21_c9e6]
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1958_c21_7e6f]
signal MUX_uxn_opcodes_h_l1958_c21_7e6f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_7e6f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_7e6f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_7e6f_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output);

-- t16_MUX_uxn_opcodes_h_l1924_c2_0f56
t16_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
t16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- n16_MUX_uxn_opcodes_h_l1924_c2_0f56
n16_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
n16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_cond,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_left,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_right,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output);

-- t16_MUX_uxn_opcodes_h_l1937_c7_da96
t16_MUX_uxn_opcodes_h_l1937_c7_da96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1937_c7_da96_cond,
t16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue,
t16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse,
t16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output);

-- n16_MUX_uxn_opcodes_h_l1937_c7_da96
n16_MUX_uxn_opcodes_h_l1937_c7_da96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1937_c7_da96_cond,
n16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue,
n16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse,
n16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_cond,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_left,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_right,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output);

-- t16_MUX_uxn_opcodes_h_l1940_c7_b576
t16_MUX_uxn_opcodes_h_l1940_c7_b576 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1940_c7_b576_cond,
t16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue,
t16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse,
t16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output);

-- n16_MUX_uxn_opcodes_h_l1940_c7_b576
n16_MUX_uxn_opcodes_h_l1940_c7_b576 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1940_c7_b576_cond,
n16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue,
n16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse,
n16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_cond,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output);

-- t16_MUX_uxn_opcodes_h_l1945_c7_8d44
t16_MUX_uxn_opcodes_h_l1945_c7_8d44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond,
t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue,
t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse,
t16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output);

-- n16_MUX_uxn_opcodes_h_l1945_c7_8d44
n16_MUX_uxn_opcodes_h_l1945_c7_8d44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond,
n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue,
n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse,
n16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_cond,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876
BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_left,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_right,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_left,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_right,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output);

-- n16_MUX_uxn_opcodes_h_l1949_c7_d9d0
n16_MUX_uxn_opcodes_h_l1949_c7_d9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond,
n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue,
n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse,
n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_left,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_right,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output);

-- n16_MUX_uxn_opcodes_h_l1953_c7_7daa
n16_MUX_uxn_opcodes_h_l1953_c7_7daa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1953_c7_7daa_cond,
n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue,
n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse,
n16_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf
BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_left,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_right,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e
sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_ins,
sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_x,
sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_y,
sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6
BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_left,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_right,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_return_output);

-- MUX_uxn_opcodes_h_l1958_c21_7e6f
MUX_uxn_opcodes_h_l1958_c21_7e6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1958_c21_7e6f_cond,
MUX_uxn_opcodes_h_l1958_c21_7e6f_iftrue,
MUX_uxn_opcodes_h_l1958_c21_7e6f_iffalse,
MUX_uxn_opcodes_h_l1958_c21_7e6f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990
CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output,
 t16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 n16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output,
 t16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output,
 n16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output,
 t16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output,
 n16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output,
 t16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output,
 n16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output,
 n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output,
 n16_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_return_output,
 sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_return_output,
 MUX_uxn_opcodes_h_l1958_c21_7e6f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_d3f4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_1121 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_9a2d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_c8e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_cebd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_48f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1924_l1953_l1949_DUPLICATE_bf9d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_b186_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_0e46_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_854a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_8559_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_29f4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1962_l1920_DUPLICATE_2278_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_c8e0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_c8e0;
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_y := resize(to_signed(-3, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_d3f4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_d3f4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_48f7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_48f7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_cebd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_cebd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_9a2d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_9a2d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_1121 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_1121;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse := t16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_589a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_854a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_854a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_2e61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_left;
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output := BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_0da3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_4596] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1924_l1953_l1949_DUPLICATE_bf9d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1924_l1953_l1949_DUPLICATE_bf9d_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_8559 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_8559_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_0e46 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_0e46_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_a0b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_5753] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_left;
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output := BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1955_c30_ad7e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_ins;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_x;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_return_output := sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_29f4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_29f4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_b186 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_b186_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_a0b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_589a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_0da3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_4596_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_2e61_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_5753_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_8559_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_8559_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1954_l1946_l1950_DUPLICATE_8559_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_b186_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_b186_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_b186_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_b186_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_b186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_854a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_854a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_854a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_854a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_854a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_0e46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_0e46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_0e46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_0e46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1953_l1949_DUPLICATE_0e46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_29f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_29f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1924_l1953_l1949_DUPLICATE_bf9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1924_l1953_l1949_DUPLICATE_bf9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1924_l1953_l1949_DUPLICATE_bf9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1924_l1953_l1949_DUPLICATE_bf9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1924_l1953_l1949_DUPLICATE_bf9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1945_l1940_l1937_l1924_l1953_l1949_DUPLICATE_bf9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_0f56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_ad7e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_7daa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_7daa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_7daa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_7daa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1946_c3_a876] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_left;
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_return_output := BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1954_c3_37cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_left;
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_return_output := BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_a876_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_37cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_6990_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;
     -- n16_MUX[uxn_opcodes_h_l1953_c7_7daa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1953_c7_7daa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_cond;
     n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue;
     n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output := n16_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;

     -- t16_MUX[uxn_opcodes_h_l1945_c7_8d44] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond;
     t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue;
     t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output := t16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1958_c21_c9e6] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_left;
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_return_output := BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_d9d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_d9d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_d9d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_d9d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_c9e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_8d44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;

     -- t16_MUX[uxn_opcodes_h_l1940_c7_b576] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1940_c7_b576_cond <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_cond;
     t16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue;
     t16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output := t16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;

     -- n16_MUX[uxn_opcodes_h_l1949_c7_d9d0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond;
     n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue;
     n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output := n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_8d44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_8d44] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_8d44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;

     -- MUX[uxn_opcodes_h_l1958_c21_7e6f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1958_c21_7e6f_cond <= VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_cond;
     MUX_uxn_opcodes_h_l1958_c21_7e6f_iftrue <= VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_iftrue;
     MUX_uxn_opcodes_h_l1958_c21_7e6f_iffalse <= VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_return_output := MUX_uxn_opcodes_h_l1958_c21_7e6f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue := VAR_MUX_uxn_opcodes_h_l1958_c21_7e6f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;
     -- t16_MUX[uxn_opcodes_h_l1937_c7_da96] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1937_c7_da96_cond <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_cond;
     t16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue;
     t16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output := t16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_b576] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_b576] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_b576] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_7daa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_b576] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;

     -- n16_MUX[uxn_opcodes_h_l1945_c7_8d44] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_cond;
     n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue;
     n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output := n16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_7daa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_da96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;

     -- t16_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := t16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_da96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_d9d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_da96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;

     -- n16_MUX[uxn_opcodes_h_l1940_c7_b576] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1940_c7_b576_cond <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_cond;
     n16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue;
     n16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output := n16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_da96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_d9d0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- n16_MUX[uxn_opcodes_h_l1937_c7_da96] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1937_c7_da96_cond <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_cond;
     n16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue;
     n16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output := n16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_8d44] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output := result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_8d44_return_output;
     -- n16_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := n16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_b576] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_return_output := result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_b576_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_da96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_return_output := result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_da96_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_0f56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output := result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1962_l1920_DUPLICATE_2278 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1962_l1920_DUPLICATE_2278_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_0f56_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1962_l1920_DUPLICATE_2278_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1962_l1920_DUPLICATE_2278_return_output;
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
