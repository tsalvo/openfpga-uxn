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
-- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_427e]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_a9b2]
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_e270]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2509_c7_18e6]
signal t16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2509_c7_18e6]
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_18e6]
signal n16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_18e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_18e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_18e6]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_18e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_18e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_c816]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2512_c7_20ae]
signal t16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2512_c7_20ae]
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_20ae]
signal n16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_20ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_20ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_20ae]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_20ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_20ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_e3b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2517_c7_52a5]
signal t16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2517_c7_52a5]
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2517_c7_52a5]
signal n16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_52a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_52a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_52a5]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_52a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_52a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2518_c3_4519]
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_88a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2521_c7_fc29]
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2521_c7_fc29]
signal n16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_fc29]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_fc29]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_fc29]
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_fc29]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_fc29]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_df2f]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2525_c7_1a11]
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2525_c7_1a11]
signal n16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_1a11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_1a11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_1a11]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_1a11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_1a11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2526_c3_29b4]
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_5f11]
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2528_c30_dfa5]
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_0e6c]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_54cc]
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_54cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_54cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_54cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2536_c31_e224]
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c2_a9b2
t16_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2
tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- n16_MUX_uxn_opcodes_h_l2496_c2_a9b2
n16_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output);

-- t16_MUX_uxn_opcodes_h_l2509_c7_18e6
t16_MUX_uxn_opcodes_h_l2509_c7_18e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond,
t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue,
t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse,
t16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6
tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond,
tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_18e6
n16_MUX_uxn_opcodes_h_l2509_c7_18e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output);

-- t16_MUX_uxn_opcodes_h_l2512_c7_20ae
t16_MUX_uxn_opcodes_h_l2512_c7_20ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond,
t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue,
t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse,
t16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae
tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond,
tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_20ae
n16_MUX_uxn_opcodes_h_l2512_c7_20ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output);

-- t16_MUX_uxn_opcodes_h_l2517_c7_52a5
t16_MUX_uxn_opcodes_h_l2517_c7_52a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond,
t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue,
t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse,
t16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5
tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond,
tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output);

-- n16_MUX_uxn_opcodes_h_l2517_c7_52a5
n16_MUX_uxn_opcodes_h_l2517_c7_52a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond,
n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue,
n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse,
n16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519
BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_left,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_right,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29
tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond,
tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue,
tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse,
tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output);

-- n16_MUX_uxn_opcodes_h_l2521_c7_fc29
n16_MUX_uxn_opcodes_h_l2521_c7_fc29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond,
n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue,
n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse,
n16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_cond,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11
tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond,
tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue,
tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse,
tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output);

-- n16_MUX_uxn_opcodes_h_l2525_c7_1a11
n16_MUX_uxn_opcodes_h_l2525_c7_1a11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond,
n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue,
n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse,
n16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4
BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_left,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_right,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_left,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_right,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5
sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_ins,
sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_x,
sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_y,
sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2536_c31_e224
CONST_SR_8_uxn_opcodes_h_l2536_c31_e224 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_x,
CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7
CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output,
 t16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output,
 t16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output,
 t16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output,
 n16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output,
 n16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output,
 n16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_return_output,
 sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output,
 CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_e296 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_b959 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_6806 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_a45f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_7ee7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_b9d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_fef1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_b880 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_d2e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_a05f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2496_l2533_l2521_l2517_l2512_l2509_DUPLICATE_e6c6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2533_l2521_l2517_l2512_l2509_DUPLICATE_8194_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_2494_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2525_l2521_l2517_l2512_l2509_DUPLICATE_4864_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2513_l2526_l2522_DUPLICATE_c78c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_ab36_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2540_l2492_DUPLICATE_61af_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_b9d8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_b9d8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_d2e6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_d2e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_7ee7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_7ee7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_a45f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_a45f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_6806 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_6806;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_b880 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_b880;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_b959 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_b959;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_e296 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_e296;
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_y := resize(to_signed(-2, 3), 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse := tmp16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2533_l2521_l2517_l2512_l2509_DUPLICATE_8194 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2533_l2521_l2517_l2512_l2509_DUPLICATE_8194_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2513_l2526_l2522_DUPLICATE_c78c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2513_l2526_l2522_DUPLICATE_c78c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_e270] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_c816] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2525_l2521_l2517_l2512_l2509_DUPLICATE_4864 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2525_l2521_l2517_l2512_l2509_DUPLICATE_4864_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_2494 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_2494_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_427e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_ab36 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_ab36_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_df2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_e3b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2496_l2533_l2521_l2517_l2512_l2509_DUPLICATE_e6c6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2496_l2533_l2521_l2517_l2512_l2509_DUPLICATE_e6c6_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2536_c31_e224] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_return_output := CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_0e6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2528_c30_dfa5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_ins;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_x;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_return_output := sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_88a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_427e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_e270_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c816_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_e3b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_88a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_df2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_0e6c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2513_l2526_l2522_DUPLICATE_c78c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2513_l2526_l2522_DUPLICATE_c78c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2518_l2513_l2526_l2522_DUPLICATE_c78c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2533_l2521_l2517_l2512_l2509_DUPLICATE_8194_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2533_l2521_l2517_l2512_l2509_DUPLICATE_8194_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2533_l2521_l2517_l2512_l2509_DUPLICATE_8194_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2533_l2521_l2517_l2512_l2509_DUPLICATE_8194_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2533_l2521_l2517_l2512_l2509_DUPLICATE_8194_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2525_l2521_l2517_l2512_l2509_DUPLICATE_4864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2525_l2521_l2517_l2512_l2509_DUPLICATE_4864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2525_l2521_l2517_l2512_l2509_DUPLICATE_4864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2525_l2521_l2517_l2512_l2509_DUPLICATE_4864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2525_l2521_l2517_l2512_l2509_DUPLICATE_4864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2525_l2521_l2517_l2512_l2509_DUPLICATE_4864_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_2494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_2494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_2494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_2494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_2494_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_ab36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_ab36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2496_l2533_l2521_l2517_l2512_l2509_DUPLICATE_e6c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2496_l2533_l2521_l2517_l2512_l2509_DUPLICATE_e6c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2496_l2533_l2521_l2517_l2512_l2509_DUPLICATE_e6c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2496_l2533_l2521_l2517_l2512_l2509_DUPLICATE_e6c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2496_l2533_l2521_l2517_l2512_l2509_DUPLICATE_e6c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2496_l2533_l2521_l2517_l2512_l2509_DUPLICATE_e6c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_a9b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_dfa5_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_1a11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_54cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2518_c3_4519] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_left;
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_return_output := BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2536_c21_a05f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_a05f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e224_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2526_c3_29b4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_left;
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_return_output := BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_54cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_54cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_4519_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_29b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_a05f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2514_l2523_DUPLICATE_55c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_5f11] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_1a11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_54cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_1a11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_fc29] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;

     -- n16_MUX[uxn_opcodes_h_l2525_c7_1a11] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond;
     n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue;
     n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output := n16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_1a11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;

     -- t16_MUX[uxn_opcodes_h_l2517_c7_52a5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond;
     t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue;
     t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output := t16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_54cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_fc29] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_fc29] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2531_c21_fef1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_fef1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_5f11_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_52a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_fc29] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2525_c7_1a11] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_cond;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output := tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;

     -- t16_MUX[uxn_opcodes_h_l2512_c7_20ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond;
     t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue;
     t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output := t16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2521_c7_fc29] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond;
     n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue;
     n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output := n16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_fef1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_52a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2521_c7_fc29] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_cond;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output := tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;

     -- n16_MUX[uxn_opcodes_h_l2517_c7_52a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond;
     n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue;
     n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output := n16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_20ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_52a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_1a11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;

     -- t16_MUX[uxn_opcodes_h_l2509_c7_18e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond;
     t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue;
     t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output := t16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_52a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_1a11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2517_c7_52a5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_cond;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output := tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_20ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_18e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_20ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_20ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2512_c7_20ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;

     -- t16_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_fc29] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output := result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_fc29_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_18e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_52a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2512_c7_20ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_cond;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output := tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_18e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2509_c7_18e6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_18e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_52a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;
     -- n16_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_20ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2509_c7_18e6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_cond;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output := tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_20ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_18e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_18e6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_a9b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2540_l2492_DUPLICATE_61af LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2540_l2492_DUPLICATE_61af_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a9b2_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2540_l2492_DUPLICATE_61af_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2540_l2492_DUPLICATE_61af_return_output;
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
