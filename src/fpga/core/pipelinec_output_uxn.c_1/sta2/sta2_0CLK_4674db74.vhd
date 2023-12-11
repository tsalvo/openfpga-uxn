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
-- BIN_OP_EQ[uxn_opcodes_h_l2362_c6_bde3]
signal BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal t16_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2362_c2_80bc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_c01c]
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2375_c7_7ba0]
signal n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2375_c7_7ba0]
signal n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2375_c7_7ba0]
signal t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_7ba0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2375_c7_7ba0]
signal result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2375_c7_7ba0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_7ba0]
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_7ba0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_7ba0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_f869]
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2378_c7_ed00]
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2378_c7_ed00]
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2378_c7_ed00]
signal t16_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_ed00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2378_c7_ed00]
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2378_c7_ed00]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2378_c7_ed00]
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2378_c7_ed00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2378_c7_ed00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2380_c3_7520]
signal CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2383_c11_fd04]
signal BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2383_c7_8f63]
signal n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2383_c7_8f63]
signal n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2383_c7_8f63]
signal t16_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2383_c7_8f63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2383_c7_8f63]
signal result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2383_c7_8f63]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2383_c7_8f63]
signal result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2383_c7_8f63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2383_c7_8f63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2384_c3_516a]
signal BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2387_c11_5d1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2387_c7_8ead]
signal n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2387_c7_8ead]
signal n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c7_8ead]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2387_c7_8ead]
signal result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2387_c7_8ead]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2387_c7_8ead]
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c7_8ead]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2389_c30_6008]
signal sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2394_c11_78f2]
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2394_c7_0f26]
signal n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2394_c7_0f26]
signal result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2394_c7_0f26]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2394_c7_0f26]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2394_c7_0f26]
signal result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2397_c22_c3c9]
signal BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a75( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3
BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_left,
BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_right,
BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc
n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc
n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- t16_MUX_uxn_opcodes_h_l2362_c2_80bc
t16_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
t16_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_left,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_right,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0
n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond,
n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue,
n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse,
n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0
n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond,
n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue,
n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse,
n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output);

-- t16_MUX_uxn_opcodes_h_l2375_c7_7ba0
t16_MUX_uxn_opcodes_h_l2375_c7_7ba0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond,
t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue,
t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse,
t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond,
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_left,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_right,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00
n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_cond,
n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue,
n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse,
n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00
n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_cond,
n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue,
n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse,
n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output);

-- t16_MUX_uxn_opcodes_h_l2378_c7_ed00
t16_MUX_uxn_opcodes_h_l2378_c7_ed00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2378_c7_ed00_cond,
t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue,
t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse,
t16_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond,
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond,
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2380_c3_7520
CONST_SL_8_uxn_opcodes_h_l2380_c3_7520 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_x,
CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_left,
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_right,
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63
n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_cond,
n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue,
n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse,
n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63
n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_cond,
n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue,
n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse,
n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output);

-- t16_MUX_uxn_opcodes_h_l2383_c7_8f63
t16_MUX_uxn_opcodes_h_l2383_c7_8f63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2383_c7_8f63_cond,
t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue,
t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse,
t16_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond,
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond,
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a
BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_left,
BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_right,
BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead
n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_cond,
n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue,
n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse,
n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead
n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_cond,
n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue,
n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse,
n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond,
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond,
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2389_c30_6008
sp_relative_shift_uxn_opcodes_h_l2389_c30_6008 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_ins,
sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_x,
sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_y,
sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_left,
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_right,
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26
n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_cond,
n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue,
n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse,
n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond,
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond,
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9
BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_left,
BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_right,
BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output,
 n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 t16_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output,
 n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output,
 t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output,
 n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output,
 n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output,
 t16_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output,
 CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output,
 n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output,
 n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output,
 t16_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output,
 n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output,
 n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output,
 sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output,
 n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2367_c3_f3ec : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2372_c3_3076 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_2fc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2381_c3_9aa2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2385_c3_6465 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_c7_8f63_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2396_c3_1548 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2397_c3_1824 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_e0b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_beb2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_55ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2378_l2383_l2375_l2387_DUPLICATE_ba5c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2394_l2383_l2375_DUPLICATE_57b2_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2379_l2384_DUPLICATE_257a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l2357_l2402_DUPLICATE_26dd_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2372_c3_3076 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2372_c3_3076;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2385_c3_6465 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2385_c3_6465;
     VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_2fc1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_2fc1;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2367_c3_f3ec := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2367_c3_f3ec;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2396_c3_1548 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2396_c3_1548;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2381_c3_9aa2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2381_c3_9aa2;
     VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_y := to_signed(-4, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l2389_c30_6008] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_ins;
     sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_x;
     sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_return_output := sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2378_l2383_l2375_l2387_DUPLICATE_ba5c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2378_l2383_l2375_l2387_DUPLICATE_ba5c_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2397_c22_c3c9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_c7_8f63_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2387_c11_5d1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2394_c11_78f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_f869] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_left;
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output := BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2362_c6_bde3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_beb2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_beb2_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2379_l2384_DUPLICATE_257a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2379_l2384_DUPLICATE_257a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_55ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_55ff_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_c01c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_e0b3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_e0b3_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2394_l2383_l2375_DUPLICATE_57b2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2394_l2383_l2375_DUPLICATE_57b2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2383_c11_fd04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c6_bde3_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_c01c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_f869_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_fd04_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_5d1b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_78f2_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2397_c3_1824 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2397_c22_c3c9_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2379_l2384_DUPLICATE_257a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2379_l2384_DUPLICATE_257a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2394_l2383_l2375_DUPLICATE_57b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2394_l2383_l2375_DUPLICATE_57b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2394_l2383_l2375_DUPLICATE_57b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2394_l2383_l2375_DUPLICATE_57b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_e0b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_e0b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_e0b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_e0b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_e0b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_55ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_55ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_55ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_55ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2375_l2394_l2387_l2383_DUPLICATE_55ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2378_l2383_l2375_l2387_DUPLICATE_ba5c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2378_l2383_l2375_l2387_DUPLICATE_ba5c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2378_l2383_l2375_l2387_DUPLICATE_ba5c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2378_l2383_l2375_l2387_DUPLICATE_ba5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_beb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_beb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_beb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_beb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2378_l2375_l2362_l2394_l2383_DUPLICATE_beb2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2362_c2_80bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_c7_8f63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2389_c30_6008_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2397_c3_1824;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2387_c7_8ead] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2394_c7_0f26] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2384_c3_516a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_left;
     BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_return_output := BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2387_c7_8ead] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_cond;
     n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output := n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2394_c7_0f26] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2380_c3_7520] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_return_output := CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2394_c7_0f26] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output := result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2394_c7_0f26] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_cond;
     n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output := n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2394_c7_0f26] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output := result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_516a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2380_c3_7520_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2394_c7_0f26_return_output;
     -- t16_MUX[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2383_c7_8f63_cond <= VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_cond;
     t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue;
     t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output := t16_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c7_8ead] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_cond;
     n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output := n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2387_c7_8ead] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output := result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2378_c7_ed00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c7_8ead] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2387_c7_8ead] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_cond;
     n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output := n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2387_c7_8ead] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output := result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c7_8ead_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2378_c7_ed00] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_7ba0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_cond;
     n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output := n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output := result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;

     -- t16_MUX[uxn_opcodes_h_l2378_c7_ed00] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2378_c7_ed00_cond <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_cond;
     t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue;
     t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output := t16_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2378_c7_ed00] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_cond;
     n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output := n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output := result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2383_c7_8f63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2383_c7_8f63_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;
     -- t16_MUX[uxn_opcodes_h_l2375_c7_7ba0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond;
     t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue;
     t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output := t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2375_c7_7ba0] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond;
     n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output := n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2378_c7_ed00] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output := result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2378_c7_ed00] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_cond;
     n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output := n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2378_c7_ed00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output := result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2375_c7_7ba0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2378_c7_ed00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_ed00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_ed00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_7ba0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2375_c7_7ba0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond;
     n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output := n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2375_c7_7ba0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output := result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_7ba0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := t16_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_7ba0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_7ba0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2362_c2_80bc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_cond;
     n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output := n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l2357_l2402_DUPLICATE_26dd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l2357_l2402_DUPLICATE_26dd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a75(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2362_c2_80bc_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l2357_l2402_DUPLICATE_26dd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l2357_l2402_DUPLICATE_26dd_return_output;
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
