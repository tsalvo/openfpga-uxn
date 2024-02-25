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
-- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_f9ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2496_c2_a2d4]
signal n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_d482]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2509_c7_d6d9]
signal t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2509_c7_d6d9]
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_d6d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_d6d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_d6d9]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_d6d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_d6d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_d6d9]
signal n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_c87f]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2512_c7_36a0]
signal t16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2512_c7_36a0]
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_36a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_36a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_36a0]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_36a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_36a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_36a0]
signal n16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_2717]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2517_c7_9e54]
signal t16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2517_c7_9e54]
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_9e54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_9e54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_9e54]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_9e54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_9e54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2517_c7_9e54]
signal n16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2518_c3_1a58]
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_b91f]
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2521_c7_8086]
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_8086]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_8086]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_8086]
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_8086]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_8086]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2521_c7_8086]
signal n16_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_d6e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2525_c7_4848]
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_4848]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_4848]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_4848]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_4848]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_4848]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2525_c7_4848]
signal n16_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2526_c3_ec5b]
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_0255]
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2528_c30_6013]
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_990f]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_8af5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_8af5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_8af5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_8af5]
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2536_c31_0e8b]
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c2_a2d4
t16_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4
tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- n16_MUX_uxn_opcodes_h_l2496_c2_a2d4
n16_MUX_uxn_opcodes_h_l2496_c2_a2d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond,
n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue,
n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse,
n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output);

-- t16_MUX_uxn_opcodes_h_l2509_c7_d6d9
t16_MUX_uxn_opcodes_h_l2509_c7_d6d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond,
t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue,
t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse,
t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9
tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond,
tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_d6d9
n16_MUX_uxn_opcodes_h_l2509_c7_d6d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output);

-- t16_MUX_uxn_opcodes_h_l2512_c7_36a0
t16_MUX_uxn_opcodes_h_l2512_c7_36a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond,
t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue,
t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse,
t16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0
tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond,
tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_36a0
n16_MUX_uxn_opcodes_h_l2512_c7_36a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output);

-- t16_MUX_uxn_opcodes_h_l2517_c7_9e54
t16_MUX_uxn_opcodes_h_l2517_c7_9e54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond,
t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue,
t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse,
t16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54
tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond,
tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue,
tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse,
tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output);

-- n16_MUX_uxn_opcodes_h_l2517_c7_9e54
n16_MUX_uxn_opcodes_h_l2517_c7_9e54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond,
n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue,
n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse,
n16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58
BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_left,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_right,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_left,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_right,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2521_c7_8086
tmp16_MUX_uxn_opcodes_h_l2521_c7_8086 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_cond,
tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue,
tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse,
tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_cond,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_return_output);

-- n16_MUX_uxn_opcodes_h_l2521_c7_8086
n16_MUX_uxn_opcodes_h_l2521_c7_8086 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2521_c7_8086_cond,
n16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue,
n16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse,
n16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2525_c7_4848
tmp16_MUX_uxn_opcodes_h_l2525_c7_4848 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_cond,
tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue,
tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse,
tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_return_output);

-- n16_MUX_uxn_opcodes_h_l2525_c7_4848
n16_MUX_uxn_opcodes_h_l2525_c7_4848 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2525_c7_4848_cond,
n16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue,
n16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse,
n16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b
BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_left,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_right,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_left,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_right,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2528_c30_6013
sp_relative_shift_uxn_opcodes_h_l2528_c30_6013 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_ins,
sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_x,
sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_y,
sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b
CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_x,
CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output,
 t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output,
 t16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output,
 t16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output,
 tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output,
 n16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_return_output,
 n16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_return_output,
 n16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_return_output,
 sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output,
 CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_343c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_1142 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_3743 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_b84a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_144f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_4dd1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_1a65_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_bd6a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_c429 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_7542_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_3c90_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2525_DUPLICATE_5961_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_e956_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_l2525_DUPLICATE_577a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2526_l2522_l2518_DUPLICATE_ee2f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_5000_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2540_l2492_DUPLICATE_dcfd_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_144f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_144f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_bd6a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_bd6a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_3743 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_3743;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_c429 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_c429;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_4dd1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_4dd1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_343c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_343c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_b84a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_b84a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_1142 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_1142;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_990f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output := result.is_pc_updated;

     -- CONST_SR_8[uxn_opcodes_h_l2536_c31_0e8b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_return_output := CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_l2525_DUPLICATE_577a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_l2525_DUPLICATE_577a_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2526_l2522_l2518_DUPLICATE_ee2f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2526_l2522_l2518_DUPLICATE_ee2f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_b91f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_2717] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_d482] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_e956 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_e956_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_c87f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_f9ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_5000 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_5000_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_3c90 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_3c90_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2528_c30_6013] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_ins;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_x;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_return_output := sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_d6e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2525_DUPLICATE_5961 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2525_DUPLICATE_5961_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_f9ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_d482_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_c87f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2717_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b91f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d6e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_990f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2526_l2522_l2518_DUPLICATE_ee2f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2526_l2522_l2518_DUPLICATE_ee2f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2526_l2522_l2518_DUPLICATE_ee2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_e956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_e956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_e956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_e956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_e956_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_l2525_DUPLICATE_577a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_l2525_DUPLICATE_577a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_l2525_DUPLICATE_577a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_l2525_DUPLICATE_577a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_l2525_DUPLICATE_577a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_l2525_DUPLICATE_577a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2525_DUPLICATE_5961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2525_DUPLICATE_5961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2525_DUPLICATE_5961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2525_DUPLICATE_5961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2525_DUPLICATE_5961_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_5000_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_5000_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_3c90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_3c90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_3c90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_3c90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_3c90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_3c90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_a2d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_6013_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_4848] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_8af5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_8af5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2526_c3_ec5b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_left;
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_return_output := BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2518_c3_1a58] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_left;
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_return_output := BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2536_c21_7542] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_7542_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_0e8b_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_8af5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_1a58_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_ec5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_7542_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_b70f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_4848] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_8086] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;

     -- t16_MUX[uxn_opcodes_h_l2517_c7_9e54] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond;
     t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue;
     t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output := t16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;

     -- n16_MUX[uxn_opcodes_h_l2525_c7_4848] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2525_c7_4848_cond <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_cond;
     n16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue;
     n16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output := n16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_4848] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_8af5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_4848] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_0255] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_8af5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_8086] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2525_c7_4848] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_cond;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output := tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_9e54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;

     -- t16_MUX[uxn_opcodes_h_l2512_c7_36a0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond;
     t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue;
     t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output := t16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_8086] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;

     -- n16_MUX[uxn_opcodes_h_l2521_c7_8086] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2521_c7_8086_cond <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_cond;
     n16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue;
     n16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output := n16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_8086] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2531_c21_1a65] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_1a65_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_0255_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_1a65_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_4848] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2521_c7_8086] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_cond;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output := tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_9e54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_9e54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;

     -- n16_MUX[uxn_opcodes_h_l2517_c7_9e54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond;
     n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue;
     n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output := n16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;

     -- t16_MUX[uxn_opcodes_h_l2509_c7_d6d9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond;
     t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue;
     t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output := t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_36a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_9e54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_4848_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_36a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_36a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2512_c7_36a0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_8086] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_return_output := result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_d6d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2517_c7_9e54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_cond;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output := tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_36a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_8086_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_d6d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_d6d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2512_c7_36a0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_cond;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output := tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_d6d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2509_c7_d6d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_9e54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_9e54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_36a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2509_c7_d6d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output := tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_36a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_d6d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d6d9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_a2d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2540_l2492_DUPLICATE_dcfd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2540_l2492_DUPLICATE_dcfd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_a2d4_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2540_l2492_DUPLICATE_dcfd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2540_l2492_DUPLICATE_dcfd_return_output;
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
