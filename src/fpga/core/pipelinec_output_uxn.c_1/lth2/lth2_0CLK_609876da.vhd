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
entity lth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_609876da;
architecture arch of lth2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_e99a]
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal t16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1924_c2_bf97]
signal n16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_575f]
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_0b66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_0b66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_0b66]
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_0b66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_0b66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1937_c7_0b66]
signal t16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1937_c7_0b66]
signal n16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_18fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_7928]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_7928]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_7928]
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_7928]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_7928]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1940_c7_7928]
signal t16_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1940_c7_7928]
signal n16_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_e965]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_a8eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_a8eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_a8eb]
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_a8eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_a8eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1945_c7_a8eb]
signal t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1945_c7_a8eb]
signal n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1946_c3_0fbb]
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_a4aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_3b67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_3b67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_3b67]
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_3b67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_3b67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1949_c7_3b67]
signal n16_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_e621]
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_afc1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_afc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_afc1]
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_afc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_afc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1953_c7_afc1]
signal n16_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1954_c3_6e03]
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1955_c30_9d7a]
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1958_c21_4599]
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1958_c21_fffd]
signal MUX_uxn_opcodes_h_l1958_c21_fffd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_fffd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_fffd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_fffd_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_left,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_right,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- t16_MUX_uxn_opcodes_h_l1924_c2_bf97
t16_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
t16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- n16_MUX_uxn_opcodes_h_l1924_c2_bf97
n16_MUX_uxn_opcodes_h_l1924_c2_bf97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond,
n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue,
n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse,
n16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_left,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_right,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_cond,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output);

-- t16_MUX_uxn_opcodes_h_l1937_c7_0b66
t16_MUX_uxn_opcodes_h_l1937_c7_0b66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond,
t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue,
t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse,
t16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output);

-- n16_MUX_uxn_opcodes_h_l1937_c7_0b66
n16_MUX_uxn_opcodes_h_l1937_c7_0b66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond,
n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue,
n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse,
n16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_cond,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_return_output);

-- t16_MUX_uxn_opcodes_h_l1940_c7_7928
t16_MUX_uxn_opcodes_h_l1940_c7_7928 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1940_c7_7928_cond,
t16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue,
t16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse,
t16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output);

-- n16_MUX_uxn_opcodes_h_l1940_c7_7928
n16_MUX_uxn_opcodes_h_l1940_c7_7928 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1940_c7_7928_cond,
n16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue,
n16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse,
n16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output);

-- t16_MUX_uxn_opcodes_h_l1945_c7_a8eb
t16_MUX_uxn_opcodes_h_l1945_c7_a8eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond,
t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue,
t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse,
t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output);

-- n16_MUX_uxn_opcodes_h_l1945_c7_a8eb
n16_MUX_uxn_opcodes_h_l1945_c7_a8eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond,
n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue,
n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse,
n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb
BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_left,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_right,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_cond,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output);

-- n16_MUX_uxn_opcodes_h_l1949_c7_3b67
n16_MUX_uxn_opcodes_h_l1949_c7_3b67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1949_c7_3b67_cond,
n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue,
n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse,
n16_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_left,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_right,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output);

-- n16_MUX_uxn_opcodes_h_l1953_c7_afc1
n16_MUX_uxn_opcodes_h_l1953_c7_afc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1953_c7_afc1_cond,
n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue,
n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse,
n16_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03
BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_left,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_right,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a
sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_ins,
sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_x,
sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_y,
sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599
BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_left,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_right,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_return_output);

-- MUX_uxn_opcodes_h_l1958_c21_fffd
MUX_uxn_opcodes_h_l1958_c21_fffd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1958_c21_fffd_cond,
MUX_uxn_opcodes_h_l1958_c21_fffd_iftrue,
MUX_uxn_opcodes_h_l1958_c21_fffd_iffalse,
MUX_uxn_opcodes_h_l1958_c21_fffd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552
CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 t16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 n16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output,
 t16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output,
 n16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_return_output,
 t16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output,
 n16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output,
 t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output,
 n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output,
 n16_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output,
 n16_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_return_output,
 sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_return_output,
 MUX_uxn_opcodes_h_l1958_c21_fffd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_b192 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_c6c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_681c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_eeac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_ec88 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_a530 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1924_l1953_l1949_l1945_l1940_l1937_DUPLICATE_6550_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_bd67_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_45ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_1257_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1950_l1954_l1941_l1946_DUPLICATE_fda9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_fee8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1962_l1920_DUPLICATE_8c24_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_ec88 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_ec88;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_eeac := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_eeac;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_c6c0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_c6c0;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_b192 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_b192;
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_681c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_681c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_a530 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_a530;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_bd67 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_bd67_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_575f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1924_l1953_l1949_l1945_l1940_l1937_DUPLICATE_6550 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1924_l1953_l1949_l1945_l1940_l1937_DUPLICATE_6550_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_fee8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_fee8_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1955_c30_9d7a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_ins;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_x;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_return_output := sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_1257 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_1257_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_45ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_45ab_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1950_l1954_l1941_l1946_DUPLICATE_fda9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1950_l1954_l1941_l1946_DUPLICATE_fda9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_18fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_e965] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_e621] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_left;
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output := BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_e99a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_a4aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_e99a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_575f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_18fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_e965_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_a4aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_e621_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1950_l1954_l1941_l1946_DUPLICATE_fda9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1950_l1954_l1941_l1946_DUPLICATE_fda9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1950_l1954_l1941_l1946_DUPLICATE_fda9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_bd67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_bd67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_bd67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_bd67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_bd67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_1257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_1257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_1257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_1257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_1257_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_45ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_45ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_45ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_45ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_45ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_fee8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_fee8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1924_l1953_l1949_l1945_l1940_l1937_DUPLICATE_6550_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1924_l1953_l1949_l1945_l1940_l1937_DUPLICATE_6550_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1924_l1953_l1949_l1945_l1940_l1937_DUPLICATE_6550_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1924_l1953_l1949_l1945_l1940_l1937_DUPLICATE_6550_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1924_l1953_l1949_l1945_l1940_l1937_DUPLICATE_6550_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1924_l1953_l1949_l1945_l1940_l1937_DUPLICATE_6550_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_bf97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_9d7a_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_afc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_afc1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1946_c3_0fbb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_left;
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_return_output := BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_afc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1954_c3_6e03] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_left;
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_return_output := BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_afc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_0fbb_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_6e03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_a552_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;
     -- t16_MUX[uxn_opcodes_h_l1945_c7_a8eb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond;
     t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue;
     t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output := t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1958_c21_4599] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_left;
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_return_output := BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_return_output;

     -- n16_MUX[uxn_opcodes_h_l1953_c7_afc1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1953_c7_afc1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_cond;
     n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue;
     n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output := n16_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_3b67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_3b67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_3b67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_3b67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_4599_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_a8eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_a8eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;

     -- MUX[uxn_opcodes_h_l1958_c21_fffd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1958_c21_fffd_cond <= VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_cond;
     MUX_uxn_opcodes_h_l1958_c21_fffd_iftrue <= VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_iftrue;
     MUX_uxn_opcodes_h_l1958_c21_fffd_iffalse <= VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_return_output := MUX_uxn_opcodes_h_l1958_c21_fffd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_a8eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1949_c7_3b67] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1949_c7_3b67_cond <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_cond;
     n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue;
     n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output := n16_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;

     -- t16_MUX[uxn_opcodes_h_l1940_c7_7928] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1940_c7_7928_cond <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_cond;
     t16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue;
     t16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output := t16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_a8eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue := VAR_MUX_uxn_opcodes_h_l1958_c21_fffd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_7928] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_7928] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;

     -- t16_MUX[uxn_opcodes_h_l1937_c7_0b66] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond;
     t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue;
     t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output := t16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_afc1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_7928] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;

     -- n16_MUX[uxn_opcodes_h_l1945_c7_a8eb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond;
     n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue;
     n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output := n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_7928] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_afc1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_0b66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;

     -- t16_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := t16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_3b67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output := result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;

     -- n16_MUX[uxn_opcodes_h_l1940_c7_7928] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1940_c7_7928_cond <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_cond;
     n16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue;
     n16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output := n16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_0b66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_0b66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_0b66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_3b67_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- n16_MUX[uxn_opcodes_h_l1937_c7_0b66] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_cond;
     n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue;
     n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output := n16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_a8eb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_a8eb_return_output;
     -- n16_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := n16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_7928] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_return_output := result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_7928_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_0b66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output := result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_0b66_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_bf97] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output := result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1962_l1920_DUPLICATE_8c24 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1962_l1920_DUPLICATE_8c24_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_bf97_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1962_l1920_DUPLICATE_8c24_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1962_l1920_DUPLICATE_8c24_return_output;
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
