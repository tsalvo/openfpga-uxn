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
-- Submodules: 42
entity jci_0CLK_4351dde2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_4351dde2;
architecture arch of jci_0CLK_4351dde2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_5faa]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_1a36]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_1a36]
signal t8_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_1a36]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_1a36]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_1a36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_1a36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_1a36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_1a36]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_1a36]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_1a36]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_1a36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_8dc0]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_72b3]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_72b3]
signal t8_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_72b3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_72b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_72b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_72b3]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_72b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_37fd]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_2b95]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_d059]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_d059]
signal t8_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_d059]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_d059]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_d059]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_d059]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_9e30]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_9b22]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_e84e]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_e84e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_e84e]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_e84e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_0b41]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_6ee5]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_993f]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_87d4]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_d134]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_0429]
signal MUX_uxn_opcodes_h_l99_c22_0429_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_0429_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_0429_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_0429_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6a57( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa
BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_1a36
tmp16_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_1a36
t8_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
t8_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36
result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0
BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_72b3
tmp16_MUX_uxn_opcodes_h_l85_c7_72b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_72b3
t8_MUX_uxn_opcodes_h_l85_c7_72b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_72b3_cond,
t8_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_72b3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3
result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95
BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_d059
tmp16_MUX_uxn_opcodes_h_l90_c7_d059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_d059_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_d059_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_d059
t8_MUX_uxn_opcodes_h_l90_c7_d059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_d059_cond,
t8_MUX_uxn_opcodes_h_l90_c7_d059_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_d059_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_d059_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059
result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_9e30
CONST_SL_8_uxn_opcodes_h_l93_c3_9e30 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22
BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_e84e
tmp16_MUX_uxn_opcodes_h_l96_c7_e84e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41
BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5
BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_return_output);

-- MUX_uxn_opcodes_h_l99_c22_0429
MUX_uxn_opcodes_h_l99_c22_0429 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_0429_cond,
MUX_uxn_opcodes_h_l99_c22_0429_iftrue,
MUX_uxn_opcodes_h_l99_c22_0429_iffalse,
MUX_uxn_opcodes_h_l99_c22_0429_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_72b3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_d059_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_d059_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_return_output,
 MUX_uxn_opcodes_h_l99_c22_0429_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_ae0a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_cacc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_25ab : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_413d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_6bdf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_72b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_4d31 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_d059_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_0429_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_0429_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_0429_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_0429_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_9dea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_d92b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_15d0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_00c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l103_l66_DUPLICATE_c454_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_6bdf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_6bdf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_4d31 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_4d31;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_25ab := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_25ab;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_ae0a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_ae0a;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_cacc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_cacc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_6ee5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_8dc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_993f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_1a36_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_2b95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_5faa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_d92b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_d92b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_9b22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_9dea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_9dea_return_output := result.is_pc_updated;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_d059] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_d059_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_1a36_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_1a36_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_15d0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_15d0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_37fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_1a36_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_00c8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_00c8_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_72b3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_72b3_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_5faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8dc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_2b95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_9b22_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_0429_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_6ee5_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_413d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_37fd_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_0429_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_993f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_15d0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_15d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_00c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_00c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_d92b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_d92b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_d92b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_9dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_9dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l85_l96_DUPLICATE_9dea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_1a36_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_1a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_1a36_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_1a36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_d059_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_72b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_413d;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_e84e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_d059] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_d059_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_d059_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_d059_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_return_output := t8_MUX_uxn_opcodes_h_l90_c7_d059_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_9e30] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_0b41] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_72b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_d059] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_e84e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_0b41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9e30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e84e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e84e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_d059_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_d059_return_output;
     -- t8_MUX[uxn_opcodes_h_l85_c7_72b3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_72b3_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_return_output := t8_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_87d4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_d059] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_72b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_d059] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_e84e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_87d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_d059_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_d059_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e84e_return_output;
     -- t8_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := t8_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_d059] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_d059_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_d059_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_d134] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_72b3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_72b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_0429_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d134_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_d059_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l85_c7_72b3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_0429] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_0429_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_0429_cond;
     MUX_uxn_opcodes_h_l99_c22_0429_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_0429_iftrue;
     MUX_uxn_opcodes_h_l99_c22_0429_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_0429_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_0429_return_output := MUX_uxn_opcodes_h_l99_c22_0429_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_0429_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_e84e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e84e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_d059] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_d059_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_72b3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_72b3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_1a36] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l103_l66_DUPLICATE_c454 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l103_l66_DUPLICATE_c454_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a57(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_1a36_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_1a36_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l103_l66_DUPLICATE_c454_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l103_l66_DUPLICATE_c454_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
