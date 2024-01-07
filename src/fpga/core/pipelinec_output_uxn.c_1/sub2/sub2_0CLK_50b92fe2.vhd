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
-- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_31a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal t16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2496_c2_05fa]
signal n16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_ce78]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_ce8d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_ce8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_ce8d]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_ce8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_ce8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2509_c7_ce8d]
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2509_c7_ce8d]
signal t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_ce8d]
signal n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_5af7]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_49a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_49a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_49a2]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_49a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_49a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2512_c7_49a2]
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2512_c7_49a2]
signal t16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_49a2]
signal n16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_efae]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_e521]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_e521]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_e521]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_e521]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_e521]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2517_c7_e521]
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2517_c7_e521]
signal t16_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2517_c7_e521]
signal n16_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2518_c3_00a0]
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_b406]
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_4ea7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_4ea7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_4ea7]
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_4ea7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_4ea7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2521_c7_4ea7]
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2521_c7_4ea7]
signal n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_62e5]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_786f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_786f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_786f]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_786f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_786f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2525_c7_786f]
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2525_c7_786f]
signal n16_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2526_c3_cdde]
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_be56]
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2528_c30_003f]
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_c0b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_9b2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_9b2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_9b2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_9b2e]
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2536_c31_e463]
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa
tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c2_05fa
t16_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- n16_MUX_uxn_opcodes_h_l2496_c2_05fa
n16_MUX_uxn_opcodes_h_l2496_c2_05fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond,
n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue,
n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse,
n16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d
tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond,
tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output);

-- t16_MUX_uxn_opcodes_h_l2509_c7_ce8d
t16_MUX_uxn_opcodes_h_l2509_c7_ce8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond,
t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue,
t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse,
t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_ce8d
n16_MUX_uxn_opcodes_h_l2509_c7_ce8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2
tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond,
tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output);

-- t16_MUX_uxn_opcodes_h_l2512_c7_49a2
t16_MUX_uxn_opcodes_h_l2512_c7_49a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond,
t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue,
t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse,
t16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_49a2
n16_MUX_uxn_opcodes_h_l2512_c7_49a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2517_c7_e521
tmp16_MUX_uxn_opcodes_h_l2517_c7_e521 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_cond,
tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue,
tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse,
tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output);

-- t16_MUX_uxn_opcodes_h_l2517_c7_e521
t16_MUX_uxn_opcodes_h_l2517_c7_e521 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2517_c7_e521_cond,
t16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue,
t16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse,
t16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output);

-- n16_MUX_uxn_opcodes_h_l2517_c7_e521
n16_MUX_uxn_opcodes_h_l2517_c7_e521 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2517_c7_e521_cond,
n16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue,
n16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse,
n16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0
BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_left,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_right,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_left,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_right,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7
tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond,
tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output);

-- n16_MUX_uxn_opcodes_h_l2521_c7_4ea7
n16_MUX_uxn_opcodes_h_l2521_c7_4ea7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond,
n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue,
n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse,
n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2525_c7_786f
tmp16_MUX_uxn_opcodes_h_l2525_c7_786f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_cond,
tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output);

-- n16_MUX_uxn_opcodes_h_l2525_c7_786f
n16_MUX_uxn_opcodes_h_l2525_c7_786f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2525_c7_786f_cond,
n16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue,
n16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse,
n16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde
BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_left,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_right,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_left,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_right,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2528_c30_003f
sp_relative_shift_uxn_opcodes_h_l2528_c30_003f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_ins,
sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_x,
sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_y,
sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2536_c31_e463
CONST_SR_8_uxn_opcodes_h_l2536_c31_e463 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_x,
CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 n16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output,
 t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output,
 t16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_return_output,
 tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output,
 t16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output,
 n16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output,
 n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output,
 n16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_return_output,
 sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_3017 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_e8f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_4234 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_8a01 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_1a24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_1656 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_9bd1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_e637 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_82d1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_a035_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2496_l2533_l2521_DUPLICATE_c2a4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2521_DUPLICATE_a006_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2525_l2521_DUPLICATE_6663_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2525_l2521_DUPLICATE_ef18_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2522_l2526_l2518_DUPLICATE_a60f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_6df6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2540_l2492_DUPLICATE_8bc3_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_e8f6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_e8f6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_1a24 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_1a24;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_8a01 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_8a01;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_e637 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_e637;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_4234 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_4234;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_82d1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_82d1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_1656 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_1656;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_3017 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_3017;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2522_l2526_l2518_DUPLICATE_a60f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2522_l2526_l2518_DUPLICATE_a60f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_31a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l2536_c31_e463] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_return_output := CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_ce78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2525_l2521_DUPLICATE_ef18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2525_l2521_DUPLICATE_ef18_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2528_c30_003f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_ins;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_x;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_return_output := sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_5af7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2521_DUPLICATE_a006 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2521_DUPLICATE_a006_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_b406] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_left;
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output := BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_c0b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_62e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_6df6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_6df6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_efae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2496_l2533_l2521_DUPLICATE_c2a4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2496_l2533_l2521_DUPLICATE_c2a4_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2525_l2521_DUPLICATE_6663 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2525_l2521_DUPLICATE_6663_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_31a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_ce78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_5af7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_efae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_b406_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_62e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_c0b7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2522_l2526_l2518_DUPLICATE_a60f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2522_l2526_l2518_DUPLICATE_a60f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2522_l2526_l2518_DUPLICATE_a60f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2521_DUPLICATE_a006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2521_DUPLICATE_a006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2521_DUPLICATE_a006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2521_DUPLICATE_a006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2521_DUPLICATE_a006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2525_l2521_DUPLICATE_ef18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2525_l2521_DUPLICATE_ef18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2525_l2521_DUPLICATE_ef18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2525_l2521_DUPLICATE_ef18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2525_l2521_DUPLICATE_ef18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2533_l2525_l2521_DUPLICATE_ef18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2525_l2521_DUPLICATE_6663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2525_l2521_DUPLICATE_6663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2525_l2521_DUPLICATE_6663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2525_l2521_DUPLICATE_6663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2525_l2521_DUPLICATE_6663_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_6df6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_6df6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2496_l2533_l2521_DUPLICATE_c2a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2496_l2533_l2521_DUPLICATE_c2a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2496_l2533_l2521_DUPLICATE_c2a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2496_l2533_l2521_DUPLICATE_c2a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2496_l2533_l2521_DUPLICATE_c2a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2512_l2509_l2496_l2533_l2521_DUPLICATE_c2a4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_05fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_003f_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_786f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2518_c3_00a0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_left;
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_return_output := BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2526_c3_cdde] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_left;
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_return_output := BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_9b2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_9b2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_9b2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2536_c21_a035] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_a035_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_e463_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_00a0_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_cdde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_a035_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_3329_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_be56] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_786f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_786f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_786f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2517_c7_e521] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2517_c7_e521_cond <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_cond;
     t16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue;
     t16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output := t16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_4ea7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_9b2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2525_c7_786f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2525_c7_786f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_cond;
     n16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue;
     n16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output := n16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_9b2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_e521] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2525_c7_786f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_cond;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output := tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_4ea7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2512_c7_49a2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond;
     t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue;
     t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output := t16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2531_c21_9bd1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_9bd1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_be56_return_output);

     -- n16_MUX[uxn_opcodes_h_l2521_c7_4ea7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond;
     n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue;
     n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output := n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_4ea7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_4ea7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_9bd1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2521_c7_4ea7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output := tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_49a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2517_c7_e521] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2517_c7_e521_cond <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_cond;
     n16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue;
     n16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output := n16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_786f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2509_c7_ce8d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond;
     t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue;
     t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output := t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_e521] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_e521] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_e521] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_786f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2517_c7_e521] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_cond;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output := tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_4ea7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_49a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_49a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_ce8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2512_c7_49a2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := t16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_49a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_4ea7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_ce8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2512_c7_49a2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_cond;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output := tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_ce8d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2509_c7_ce8d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_e521] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_ce8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_e521_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_49a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := n16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2509_c7_ce8d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output := tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_49a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_ce8d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_ce8d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_05fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2540_l2492_DUPLICATE_8bc3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2540_l2492_DUPLICATE_8bc3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_05fa_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2540_l2492_DUPLICATE_8bc3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2540_l2492_DUPLICATE_8bc3_return_output;
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
