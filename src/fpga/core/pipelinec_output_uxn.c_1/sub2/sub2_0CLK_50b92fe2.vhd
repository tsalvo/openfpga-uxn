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
-- BIN_OP_EQ[uxn_opcodes_h_l2514_c6_c933]
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal n16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2514_c2_6b54]
signal t16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2527_c11_7ef9]
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2527_c7_6b72]
signal n16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2527_c7_6b72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2527_c7_6b72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2527_c7_6b72]
signal result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2527_c7_6b72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2527_c7_6b72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2527_c7_6b72]
signal tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2527_c7_6b72]
signal t16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2530_c11_9aed]
signal BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2530_c7_5538]
signal n16_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2530_c7_5538]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2530_c7_5538]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2530_c7_5538]
signal result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2530_c7_5538]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2530_c7_5538]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2530_c7_5538]
signal tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2530_c7_5538]
signal t16_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_415d]
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2535_c7_7f00]
signal n16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_7f00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2535_c7_7f00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2535_c7_7f00]
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_7f00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2535_c7_7f00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2535_c7_7f00]
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2535_c7_7f00]
signal t16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2536_c3_498b]
signal BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2539_c11_cf3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2539_c7_6d79]
signal n16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2539_c7_6d79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2539_c7_6d79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2539_c7_6d79]
signal result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2539_c7_6d79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2539_c7_6d79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2539_c7_6d79]
signal tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2543_c11_1e9b]
signal BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2543_c7_cb00]
signal n16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2543_c7_cb00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2543_c7_cb00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2543_c7_cb00]
signal result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2543_c7_cb00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2543_c7_cb00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2543_c7_cb00]
signal tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2544_c3_de09]
signal BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2545_c11_0bff]
signal BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2546_c30_86c3]
signal sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2551_c11_153f]
signal BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2551_c7_0b3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2551_c7_0b3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2551_c7_0b3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2551_c7_0b3f]
signal result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2554_c31_f302]
signal CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933
BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_left,
BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_right,
BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output);

-- n16_MUX_uxn_opcodes_h_l2514_c2_6b54
n16_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
n16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54
result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54
result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54
result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54
tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- t16_MUX_uxn_opcodes_h_l2514_c2_6b54
t16_MUX_uxn_opcodes_h_l2514_c2_6b54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond,
t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue,
t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse,
t16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_left,
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_right,
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output);

-- n16_MUX_uxn_opcodes_h_l2527_c7_6b72
n16_MUX_uxn_opcodes_h_l2527_c7_6b72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond,
n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue,
n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse,
n16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72
result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_cond,
result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72
tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond,
tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue,
tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse,
tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output);

-- t16_MUX_uxn_opcodes_h_l2527_c7_6b72
t16_MUX_uxn_opcodes_h_l2527_c7_6b72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond,
t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue,
t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse,
t16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed
BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_left,
BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_right,
BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output);

-- n16_MUX_uxn_opcodes_h_l2530_c7_5538
n16_MUX_uxn_opcodes_h_l2530_c7_5538 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2530_c7_5538_cond,
n16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue,
n16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse,
n16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538
result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_cond,
result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538
result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538
result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2530_c7_5538
tmp16_MUX_uxn_opcodes_h_l2530_c7_5538 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_cond,
tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue,
tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse,
tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output);

-- t16_MUX_uxn_opcodes_h_l2530_c7_5538
t16_MUX_uxn_opcodes_h_l2530_c7_5538 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2530_c7_5538_cond,
t16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue,
t16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse,
t16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_left,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_right,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output);

-- n16_MUX_uxn_opcodes_h_l2535_c7_7f00
n16_MUX_uxn_opcodes_h_l2535_c7_7f00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond,
n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue,
n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse,
n16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_cond,
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00
tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond,
tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue,
tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse,
tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output);

-- t16_MUX_uxn_opcodes_h_l2535_c7_7f00
t16_MUX_uxn_opcodes_h_l2535_c7_7f00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond,
t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue,
t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse,
t16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b
BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_left,
BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_right,
BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a
BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output);

-- n16_MUX_uxn_opcodes_h_l2539_c7_6d79
n16_MUX_uxn_opcodes_h_l2539_c7_6d79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond,
n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue,
n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse,
n16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79
result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_cond,
result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79
tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond,
tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue,
tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse,
tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b
BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_left,
BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_right,
BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output);

-- n16_MUX_uxn_opcodes_h_l2543_c7_cb00
n16_MUX_uxn_opcodes_h_l2543_c7_cb00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond,
n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue,
n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse,
n16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00
result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00
result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_cond,
result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00
result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00
tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond,
tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue,
tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse,
tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09
BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_left,
BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_right,
BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff
BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_left,
BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_right,
BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3
sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_ins,
sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_x,
sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_y,
sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f
BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_left,
BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_right,
BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f
result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f
result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2554_c31_f302
CONST_SR_8_uxn_opcodes_h_l2554_c31_f302 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_x,
CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5
CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output,
 n16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 t16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output,
 n16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output,
 tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output,
 t16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output,
 n16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_return_output,
 tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output,
 t16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output,
 n16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output,
 tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output,
 t16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output,
 n16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output,
 tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output,
 n16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output,
 tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_return_output,
 sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2524_c3_e8b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2519_c3_8ca9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2528_c3_496e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2533_c3_63cb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2537_c3_1c02 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2548_c3_9058 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2549_c21_8825_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_6a4c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_2d04 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c21_8320_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2527_l2514_l2551_l2539_l2535_l2530_DUPLICATE_247e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2527_l2551_l2543_l2539_l2535_l2530_DUPLICATE_0ee2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2527_l2543_l2539_l2535_l2530_DUPLICATE_7e10_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2527_l2551_l2539_l2535_l2530_DUPLICATE_a13d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2540_l2544_l2531_DUPLICATE_e8b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2551_l2539_DUPLICATE_fdcf_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2558_l2510_DUPLICATE_5857_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2524_c3_e8b1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2524_c3_e8b1;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_2d04 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_2d04;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2528_c3_496e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2528_c3_496e;
     VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2519_c3_8ca9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2519_c3_8ca9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2537_c3_1c02 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2537_c3_1c02;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_6a4c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_6a4c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2548_c3_9058 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2548_c3_9058;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2533_c3_63cb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2533_c3_63cb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2527_l2551_l2543_l2539_l2535_l2530_DUPLICATE_0ee2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2527_l2551_l2543_l2539_l2535_l2530_DUPLICATE_0ee2_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2540_l2544_l2531_DUPLICATE_e8b6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2540_l2544_l2531_DUPLICATE_e8b6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2543_c11_1e9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2551_c11_153f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2554_c31_f302] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_return_output := CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2527_c11_7ef9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2530_c11_9aed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2546_c30_86c3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_ins;
     sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_x;
     sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_return_output := sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2527_l2514_l2551_l2539_l2535_l2530_DUPLICATE_247e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2527_l2514_l2551_l2539_l2535_l2530_DUPLICATE_247e_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2527_l2551_l2539_l2535_l2530_DUPLICATE_a13d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2527_l2551_l2539_l2535_l2530_DUPLICATE_a13d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2539_c11_cf3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2514_c6_c933] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_left;
     BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output := BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2527_l2543_l2539_l2535_l2530_DUPLICATE_7e10 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2527_l2543_l2539_l2535_l2530_DUPLICATE_7e10_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_415d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2551_l2539_DUPLICATE_fdcf LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2551_l2539_DUPLICATE_fdcf_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c6_c933_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_7ef9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_9aed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_415d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_cf3a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_1e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_153f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2540_l2544_l2531_DUPLICATE_e8b6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2540_l2544_l2531_DUPLICATE_e8b6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2540_l2544_l2531_DUPLICATE_e8b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2527_l2551_l2539_l2535_l2530_DUPLICATE_a13d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2527_l2551_l2539_l2535_l2530_DUPLICATE_a13d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2527_l2551_l2539_l2535_l2530_DUPLICATE_a13d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2527_l2551_l2539_l2535_l2530_DUPLICATE_a13d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2527_l2551_l2539_l2535_l2530_DUPLICATE_a13d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2527_l2551_l2543_l2539_l2535_l2530_DUPLICATE_0ee2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2527_l2551_l2543_l2539_l2535_l2530_DUPLICATE_0ee2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2527_l2551_l2543_l2539_l2535_l2530_DUPLICATE_0ee2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2527_l2551_l2543_l2539_l2535_l2530_DUPLICATE_0ee2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2527_l2551_l2543_l2539_l2535_l2530_DUPLICATE_0ee2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2527_l2551_l2543_l2539_l2535_l2530_DUPLICATE_0ee2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2527_l2543_l2539_l2535_l2530_DUPLICATE_7e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2527_l2543_l2539_l2535_l2530_DUPLICATE_7e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2527_l2543_l2539_l2535_l2530_DUPLICATE_7e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2527_l2543_l2539_l2535_l2530_DUPLICATE_7e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2527_l2543_l2539_l2535_l2530_DUPLICATE_7e10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2551_l2539_DUPLICATE_fdcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2551_l2539_DUPLICATE_fdcf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2527_l2514_l2551_l2539_l2535_l2530_DUPLICATE_247e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2527_l2514_l2551_l2539_l2535_l2530_DUPLICATE_247e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2527_l2514_l2551_l2539_l2535_l2530_DUPLICATE_247e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2527_l2514_l2551_l2539_l2535_l2530_DUPLICATE_247e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2527_l2514_l2551_l2539_l2535_l2530_DUPLICATE_247e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2527_l2514_l2551_l2539_l2535_l2530_DUPLICATE_247e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2514_c2_6b54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2546_c30_86c3_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2544_c3_de09] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_left;
     BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_return_output := BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2543_c7_cb00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2554_c21_8320] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c21_8320_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2554_c31_f302_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2551_c7_0b3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2551_c7_0b3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2551_c7_0b3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2536_c3_498b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_left;
     BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_return_output := BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2536_c3_498b_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2544_c3_de09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c21_8320_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2532_l2541_DUPLICATE_bde5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output;
     -- t16_MUX[uxn_opcodes_h_l2535_c7_7f00] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond <= VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond;
     t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue;
     t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output := t16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2545_c11_0bff] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2543_c7_cb00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2539_c7_6d79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2543_c7_cb00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2543_c7_cb00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2551_c7_0b3f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2543_c7_cb00] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond <= VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond;
     n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue;
     n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output := n16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2551_c7_0b3f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2539_c7_6d79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2539_c7_6d79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2549_c21_8825] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2549_c21_8825_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2545_c11_0bff_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_7f00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;

     -- t16_MUX[uxn_opcodes_h_l2530_c7_5538] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2530_c7_5538_cond <= VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_cond;
     t16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue;
     t16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output := t16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2543_c7_cb00] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_cond;
     tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output := tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;

     -- n16_MUX[uxn_opcodes_h_l2539_c7_6d79] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond <= VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond;
     n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue;
     n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output := n16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2539_c7_6d79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2549_c21_8825_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_7f00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2530_c7_5538] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;

     -- n16_MUX[uxn_opcodes_h_l2535_c7_7f00] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond <= VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond;
     n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue;
     n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output := n16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2535_c7_7f00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;

     -- t16_MUX[uxn_opcodes_h_l2527_c7_6b72] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond <= VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond;
     t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue;
     t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output := t16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2539_c7_6d79] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_cond;
     tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output := tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2543_c7_cb00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output := result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2535_c7_7f00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2543_c7_cb00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2530_c7_5538] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;

     -- t16_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := t16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2530_c7_5538] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2530_c7_5538] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;

     -- n16_MUX[uxn_opcodes_h_l2530_c7_5538] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2530_c7_5538_cond <= VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_cond;
     n16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue;
     n16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output := n16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2539_c7_6d79] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output := result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2535_c7_7f00] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_cond;
     tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output := tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2527_c7_6b72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c7_6d79_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2530_c7_5538] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_cond;
     tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output := tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2527_c7_6b72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2527_c7_6b72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2527_c7_6b72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;

     -- n16_MUX[uxn_opcodes_h_l2527_c7_6b72] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond <= VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond;
     n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue;
     n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output := n16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2535_c7_7f00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output := result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_7f00_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2530_c7_5538] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_return_output := result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2527_c7_6b72] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_cond;
     tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output := tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;

     -- n16_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := n16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2530_c7_5538_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2527_c7_6b72] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output := result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2527_c7_6b72_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2514_c2_6b54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output := result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2558_l2510_DUPLICATE_5857 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2558_l2510_DUPLICATE_5857_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2514_c2_6b54_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2558_l2510_DUPLICATE_5857_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2558_l2510_DUPLICATE_5857_return_output;
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
