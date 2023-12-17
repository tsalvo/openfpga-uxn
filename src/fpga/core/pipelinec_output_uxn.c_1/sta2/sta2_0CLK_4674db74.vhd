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
-- BIN_OP_EQ[uxn_opcodes_h_l2362_c6_1d16]
signal BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal t16_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2362_c2_3be5]
signal n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_303d]
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_03a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2375_c7_03a4]
signal result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2375_c7_03a4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_03a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_03a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_03a4]
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2375_c7_03a4]
signal t16_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2375_c7_03a4]
signal n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2375_c7_03a4]
signal n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_50c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2378_c7_ac41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2378_c7_ac41]
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2378_c7_ac41]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2378_c7_ac41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_ac41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2378_c7_ac41]
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2378_c7_ac41]
signal t16_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2378_c7_ac41]
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2378_c7_ac41]
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2380_c3_9afa]
signal CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2383_c11_09fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2383_c7_e447]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2383_c7_e447]
signal result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2383_c7_e447]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2383_c7_e447]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2383_c7_e447]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2383_c7_e447]
signal result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2383_c7_e447]
signal t16_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2383_c7_e447]
signal n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2383_c7_e447]
signal n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2384_c3_ef3d]
signal BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2387_c11_bf8f]
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2387_c7_9f16]
signal result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2387_c7_9f16]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c7_9f16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c7_9f16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2387_c7_9f16]
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2387_c7_9f16]
signal n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2387_c7_9f16]
signal n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2389_c30_c699]
signal sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2394_c11_55d1]
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2394_c7_cff4]
signal result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2394_c7_cff4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2394_c7_cff4]
signal result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2394_c7_cff4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2394_c7_cff4]
signal n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2397_c22_fef5]
signal BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16
BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_left,
BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_right,
BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- t16_MUX_uxn_opcodes_h_l2362_c2_3be5
t16_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
t16_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5
n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5
n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_cond,
n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue,
n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse,
n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_left,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_right,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond,
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output);

-- t16_MUX_uxn_opcodes_h_l2375_c7_03a4
t16_MUX_uxn_opcodes_h_l2375_c7_03a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2375_c7_03a4_cond,
t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue,
t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse,
t16_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4
n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_cond,
n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue,
n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse,
n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4
n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_cond,
n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue,
n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse,
n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond,
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond,
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output);

-- t16_MUX_uxn_opcodes_h_l2378_c7_ac41
t16_MUX_uxn_opcodes_h_l2378_c7_ac41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2378_c7_ac41_cond,
t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue,
t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse,
t16_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41
n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_cond,
n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue,
n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse,
n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41
n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_cond,
n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue,
n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse,
n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa
CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_x,
CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond,
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond,
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output);

-- t16_MUX_uxn_opcodes_h_l2383_c7_e447
t16_MUX_uxn_opcodes_h_l2383_c7_e447 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2383_c7_e447_cond,
t16_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue,
t16_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse,
t16_MUX_uxn_opcodes_h_l2383_c7_e447_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2383_c7_e447
n16_low_MUX_uxn_opcodes_h_l2383_c7_e447 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_cond,
n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue,
n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse,
n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2383_c7_e447
n16_high_MUX_uxn_opcodes_h_l2383_c7_e447 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_cond,
n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue,
n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse,
n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d
BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_left,
BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_right,
BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_left,
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_right,
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond,
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond,
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16
n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_cond,
n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue,
n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse,
n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16
n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_cond,
n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue,
n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse,
n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2389_c30_c699
sp_relative_shift_uxn_opcodes_h_l2389_c30_c699 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_ins,
sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_x,
sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_y,
sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_left,
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_right,
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond,
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4
n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_cond,
n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue,
n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse,
n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5
BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_left,
BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_right,
BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 t16_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output,
 t16_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output,
 n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output,
 n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output,
 t16_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output,
 n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output,
 n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output,
 CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output,
 t16_MUX_uxn_opcodes_h_l2383_c7_e447_return_output,
 n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_return_output,
 n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output,
 n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output,
 n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output,
 sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output,
 n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2367_c3_72ee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2372_c3_3bc6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_14a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2381_c3_1cdf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2385_c3_1a1f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_c7_e447_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2397_c3_71a8 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2396_c3_bb5e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_916b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_7193_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2387_DUPLICATE_e71b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2394_DUPLICATE_4f8e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_8b74_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2384_l2379_DUPLICATE_c751_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l2357_l2402_DUPLICATE_c275_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2385_c3_1a1f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2385_c3_1a1f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2367_c3_72ee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2367_c3_72ee;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2381_c3_1cdf := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2381_c3_1cdf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2372_c3_3bc6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2372_c3_3bc6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_14a1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_14a1;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2396_c3_bb5e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2396_c3_bb5e;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_y := to_signed(-4, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2362_c6_1d16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_left;
     BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output := BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_8b74 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_8b74_return_output := result.is_opc_done;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2384_l2379_DUPLICATE_c751 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2384_l2379_DUPLICATE_c751_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l2389_c30_c699] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_ins;
     sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_x;
     sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_return_output := sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2387_DUPLICATE_e71b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2387_DUPLICATE_e71b_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2394_DUPLICATE_4f8e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2394_DUPLICATE_4f8e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_7193 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_7193_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2394_c11_55d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2383_c11_09fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_916b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_916b_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2397_c22_fef5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_c7_e447_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_50c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_303d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2387_c11_bf8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_1d16_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_303d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_50c2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_09fd_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_bf8f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_55d1_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2397_c3_71a8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_fef5_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2384_l2379_DUPLICATE_c751_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2384_l2379_DUPLICATE_c751_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2394_DUPLICATE_4f8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2394_DUPLICATE_4f8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2394_DUPLICATE_4f8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2394_DUPLICATE_4f8e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_7193_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_7193_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_7193_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_7193_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_7193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_8b74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_8b74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_8b74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_8b74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_8b74_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2387_DUPLICATE_e71b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2387_DUPLICATE_e71b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2387_DUPLICATE_e71b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2375_l2383_l2378_l2387_DUPLICATE_e71b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_916b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_916b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_916b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_916b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_916b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2362_c2_3be5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_c7_e447_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_c699_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2397_c3_71a8;
     -- result_u8_value_MUX[uxn_opcodes_h_l2394_c7_cff4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2394_c7_cff4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2394_c7_cff4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output := result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2384_c3_ef3d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_left;
     BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_return_output := BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2394_c7_cff4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_cond;
     n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output := n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2394_c7_cff4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2387_c7_9f16] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_cond;
     n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output := n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2380_c3_9afa] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_return_output := CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2387_c7_9f16] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_ef3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_9afa_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_cff4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c7_9f16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2387_c7_9f16] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_cond;
     n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output := n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2387_c7_9f16] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output := result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;

     -- t16_MUX[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2383_c7_e447_cond <= VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_cond;
     t16_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue;
     t16_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_return_output := t16_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_cond;
     n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_return_output := n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2387_c7_9f16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output := result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c7_9f16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2378_c7_ac41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_9f16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2378_c7_ac41] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_03a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output := result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2378_c7_ac41] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_cond;
     n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output := n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_cond;
     n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_return_output := n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2383_c7_e447] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output := result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;

     -- t16_MUX[uxn_opcodes_h_l2378_c7_ac41] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2378_c7_ac41_cond <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_cond;
     t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue;
     t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output := t16_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_e447_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2378_c7_ac41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2378_c7_ac41] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output := result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2378_c7_ac41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output := result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;

     -- t16_MUX[uxn_opcodes_h_l2375_c7_03a4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2375_c7_03a4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_cond;
     t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue;
     t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output := t16_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2375_c7_03a4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_cond;
     n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output := n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2378_c7_ac41] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_cond;
     n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output := n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2375_c7_03a4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_ac41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ac41_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;
     -- t16_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := t16_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_03a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_03a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2375_c7_03a4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output := result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2375_c7_03a4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_cond;
     n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output := n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_03a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_03a4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2362_c2_3be5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l2357_l2402_DUPLICATE_c275 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l2357_l2402_DUPLICATE_c275_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_3be5_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l2357_l2402_DUPLICATE_c275_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l2357_l2402_DUPLICATE_c275_return_output;
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
