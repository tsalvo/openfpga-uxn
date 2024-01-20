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
-- Submodules: 71
entity sub2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_50b92fe2;
architecture arch of sub2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_7e1e]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2496_c2_a0b2]
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_b488]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2509_c7_ea3d]
signal t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_ea3d]
signal n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_ea3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_ea3d]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_ea3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_ea3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_ea3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2509_c7_ea3d]
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_39bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2512_c7_b5e9]
signal t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_b5e9]
signal n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_b5e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_b5e9]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_b5e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_b5e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_b5e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2512_c7_b5e9]
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_2a80]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2517_c7_38c1]
signal t16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2517_c7_38c1]
signal n16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_38c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_38c1]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_38c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_38c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_38c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2517_c7_38c1]
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2518_c3_34b2]
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_4a76]
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2521_c7_0e22]
signal n16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_0e22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_0e22]
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_0e22]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_0e22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_0e22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2521_c7_0e22]
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_3f1e]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2525_c7_091d]
signal n16_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_091d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_091d]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_091d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_091d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_091d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2525_c7_091d]
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2526_c3_3c23]
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_b9b1]
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2528_c30_5bdb]
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_31e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_9ec9]
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_9ec9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_9ec9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_9ec9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2536_c31_9a9a]
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c2_a0b2
t16_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- n16_MUX_uxn_opcodes_h_l2496_c2_a0b2
n16_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2
tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond,
tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output);

-- t16_MUX_uxn_opcodes_h_l2509_c7_ea3d
t16_MUX_uxn_opcodes_h_l2509_c7_ea3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond,
t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue,
t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse,
t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_ea3d
n16_MUX_uxn_opcodes_h_l2509_c7_ea3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d
tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond,
tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output);

-- t16_MUX_uxn_opcodes_h_l2512_c7_b5e9
t16_MUX_uxn_opcodes_h_l2512_c7_b5e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond,
t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue,
t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse,
t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_b5e9
n16_MUX_uxn_opcodes_h_l2512_c7_b5e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9
tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond,
tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output);

-- t16_MUX_uxn_opcodes_h_l2517_c7_38c1
t16_MUX_uxn_opcodes_h_l2517_c7_38c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond,
t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue,
t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse,
t16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output);

-- n16_MUX_uxn_opcodes_h_l2517_c7_38c1
n16_MUX_uxn_opcodes_h_l2517_c7_38c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond,
n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue,
n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse,
n16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1
tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond,
tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2
BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_left,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_right,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_left,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_right,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output);

-- n16_MUX_uxn_opcodes_h_l2521_c7_0e22
n16_MUX_uxn_opcodes_h_l2521_c7_0e22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond,
n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue,
n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse,
n16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_cond,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22
tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond,
tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue,
tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse,
tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output);

-- n16_MUX_uxn_opcodes_h_l2525_c7_091d
n16_MUX_uxn_opcodes_h_l2525_c7_091d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2525_c7_091d_cond,
n16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue,
n16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse,
n16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2525_c7_091d
tmp16_MUX_uxn_opcodes_h_l2525_c7_091d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_cond,
tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23
BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_left,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_right,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_left,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_right,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb
sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_ins,
sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_x,
sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_y,
sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a
CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_x,
CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output,
 t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output,
 t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output,
 t16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output,
 n16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output,
 n16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output,
 tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output,
 n16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_return_output,
 sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output,
 CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_4a56 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_f432 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_85f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_ff7a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_4596 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_6b69 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_f4a7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_af29 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_a125 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_8bf4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_993d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_73f1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_66e9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_0601_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2522_l2526_l2513_DUPLICATE_10dc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_cfe8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2540_l2492_DUPLICATE_6b9d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_ff7a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_ff7a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_f432 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_f432;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_85f1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_85f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_4596 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_4596;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_4a56 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_4a56;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_af29 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_af29;
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_6b69 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_6b69;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_a125 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_a125;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_73f1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_73f1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_0601 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_0601_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2522_l2526_l2513_DUPLICATE_10dc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2522_l2526_l2513_DUPLICATE_10dc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_4a76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_39bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2528_c30_5bdb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_ins;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_x;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_return_output := sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_66e9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_66e9_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_cfe8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_cfe8_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_993d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_993d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_b488] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_7e1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_31e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_2a80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_3f1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output := result.is_pc_updated;

     -- CONST_SR_8[uxn_opcodes_h_l2536_c31_9a9a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_return_output := CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7e1e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_b488_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_39bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2a80_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4a76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3f1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_31e0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2522_l2526_l2513_DUPLICATE_10dc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2522_l2526_l2513_DUPLICATE_10dc_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2522_l2526_l2513_DUPLICATE_10dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_66e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_66e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_66e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_66e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_66e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_0601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_0601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_0601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_0601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_0601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_0601_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_73f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_73f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_73f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_73f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_73f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_cfe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_cfe8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_993d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_993d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_993d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_993d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_993d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_993d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_a0b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5bdb_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_091d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_9ec9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2536_c21_8bf4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_8bf4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_9a9a_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_9ec9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2518_c3_34b2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_left;
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_return_output := BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2526_c3_3c23] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_left;
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_return_output := BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_9ec9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_34b2_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_3c23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_8bf4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e07f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_9ec9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_091d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_0e22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;

     -- t16_MUX[uxn_opcodes_h_l2517_c7_38c1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond;
     t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue;
     t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output := t16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_b9b1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_091d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2525_c7_091d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2525_c7_091d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_cond;
     n16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue;
     n16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output := n16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_091d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9ec9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_38c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_0e22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2525_c7_091d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_cond;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output := tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_0e22] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_0e22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;

     -- t16_MUX[uxn_opcodes_h_l2512_c7_b5e9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond;
     t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue;
     t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output := t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2521_c7_0e22] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond;
     n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue;
     n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output := n16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2531_c21_f4a7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_f4a7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_b9b1_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_f4a7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_38c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_38c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_b5e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2521_c7_0e22] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_cond;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output := tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;

     -- t16_MUX[uxn_opcodes_h_l2509_c7_ea3d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond;
     t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue;
     t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output := t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2517_c7_38c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond;
     n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue;
     n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output := n16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_091d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_38c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_091d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_0e22] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output := result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;

     -- n16_MUX[uxn_opcodes_h_l2512_c7_b5e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_b5e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2517_c7_38c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_cond;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output := tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_ea3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_b5e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_b5e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_0e22_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_38c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2512_c7_b5e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output := tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2509_c7_ea3d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_ea3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_ea3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_ea3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_38c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2509_c7_ea3d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output := tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_b5e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_b5e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_ea3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ea3d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_a0b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2540_l2492_DUPLICATE_6b9d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2540_l2492_DUPLICATE_6b9d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a0b2_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2540_l2492_DUPLICATE_6b9d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2540_l2492_DUPLICATE_6b9d_return_output;
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
