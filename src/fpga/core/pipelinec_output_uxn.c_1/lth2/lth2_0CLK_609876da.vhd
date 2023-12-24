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
-- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_24e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1924_c2_8b1f]
signal t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_078b]
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_6782]
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_6782]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_6782]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_6782]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_6782]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1937_c7_6782]
signal n16_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1937_c7_6782]
signal t16_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_a1cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_cc30]
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_cc30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_cc30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_cc30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_cc30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1940_c7_cc30]
signal n16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1940_c7_cc30]
signal t16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_0643]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_0d05]
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_0d05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_0d05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_0d05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_0d05]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1945_c7_0d05]
signal n16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1945_c7_0d05]
signal t16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1946_c3_2208]
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_8b01]
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_644d]
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_644d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_644d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_644d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_644d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1949_c7_644d]
signal n16_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_806f]
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_6105]
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_6105]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_6105]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_6105]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_6105]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1953_c7_6105]
signal n16_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1954_c3_4872]
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1955_c30_08b1]
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1958_c21_7aeb]
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1958_c21_719c]
signal MUX_uxn_opcodes_h_l1958_c21_719c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_719c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_719c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_719c_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- n16_MUX_uxn_opcodes_h_l1924_c2_8b1f
n16_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- t16_MUX_uxn_opcodes_h_l1924_c2_8b1f
t16_MUX_uxn_opcodes_h_l1924_c2_8b1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond,
t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue,
t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse,
t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_left,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_right,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_cond,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_return_output);

-- n16_MUX_uxn_opcodes_h_l1937_c7_6782
n16_MUX_uxn_opcodes_h_l1937_c7_6782 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1937_c7_6782_cond,
n16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue,
n16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse,
n16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output);

-- t16_MUX_uxn_opcodes_h_l1937_c7_6782
t16_MUX_uxn_opcodes_h_l1937_c7_6782 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1937_c7_6782_cond,
t16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue,
t16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse,
t16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_cond,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output);

-- n16_MUX_uxn_opcodes_h_l1940_c7_cc30
n16_MUX_uxn_opcodes_h_l1940_c7_cc30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond,
n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue,
n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse,
n16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output);

-- t16_MUX_uxn_opcodes_h_l1940_c7_cc30
t16_MUX_uxn_opcodes_h_l1940_c7_cc30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond,
t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue,
t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse,
t16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_cond,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output);

-- n16_MUX_uxn_opcodes_h_l1945_c7_0d05
n16_MUX_uxn_opcodes_h_l1945_c7_0d05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond,
n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue,
n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse,
n16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output);

-- t16_MUX_uxn_opcodes_h_l1945_c7_0d05
t16_MUX_uxn_opcodes_h_l1945_c7_0d05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond,
t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue,
t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse,
t16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208
BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_left,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_right,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_left,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_right,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_return_output);

-- n16_MUX_uxn_opcodes_h_l1949_c7_644d
n16_MUX_uxn_opcodes_h_l1949_c7_644d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1949_c7_644d_cond,
n16_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue,
n16_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse,
n16_MUX_uxn_opcodes_h_l1949_c7_644d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_left,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_right,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_cond,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_return_output);

-- n16_MUX_uxn_opcodes_h_l1953_c7_6105
n16_MUX_uxn_opcodes_h_l1953_c7_6105 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1953_c7_6105_cond,
n16_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue,
n16_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse,
n16_MUX_uxn_opcodes_h_l1953_c7_6105_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872
BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_left,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_right,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1
sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_ins,
sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_x,
sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_y,
sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb
BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_left,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_right,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_return_output);

-- MUX_uxn_opcodes_h_l1958_c21_719c
MUX_uxn_opcodes_h_l1958_c21_719c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1958_c21_719c_cond,
MUX_uxn_opcodes_h_l1958_c21_719c_iftrue,
MUX_uxn_opcodes_h_l1958_c21_719c_iffalse,
MUX_uxn_opcodes_h_l1958_c21_719c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_return_output,
 n16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output,
 t16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output,
 n16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output,
 t16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output,
 n16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output,
 t16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_return_output,
 n16_MUX_uxn_opcodes_h_l1949_c7_644d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_return_output,
 n16_MUX_uxn_opcodes_h_l1953_c7_6105_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_return_output,
 sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_return_output,
 MUX_uxn_opcodes_h_l1958_c21_719c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_69bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_6c8f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_ae9c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_2da5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_cc59 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_0471 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_719c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_719c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_719c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_719c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1940_l1937_l1924_l1953_l1949_l1945_DUPLICATE_8b32_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_209b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_d740_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_fd0b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1954_l1941_l1950_DUPLICATE_d6dd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_9cee_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1962_l1920_DUPLICATE_97be_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_6c8f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_6c8f;
     VAR_MUX_uxn_opcodes_h_l1958_c21_719c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_2da5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_2da5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_ae9c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_ae9c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_cc59 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_cc59;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1958_c21_719c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_69bc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_69bc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_0471 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_0471;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_078b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1954_l1941_l1950_DUPLICATE_d6dd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1954_l1941_l1950_DUPLICATE_d6dd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_24e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_fd0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_fd0b_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_d740 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_d740_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_209b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_209b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_a1cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1940_l1937_l1924_l1953_l1949_l1945_DUPLICATE_8b32 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1940_l1937_l1924_l1953_l1949_l1945_DUPLICATE_8b32_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_8b01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1955_c30_08b1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_ins;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_x;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_return_output := sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_806f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_9cee LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_9cee_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_0643] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_24e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_078b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a1cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_0643_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_8b01_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_806f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1954_l1941_l1950_DUPLICATE_d6dd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1954_l1941_l1950_DUPLICATE_d6dd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1954_l1941_l1950_DUPLICATE_d6dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_209b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_209b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_209b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_209b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_209b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_d740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_d740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_d740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_d740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_d740_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1940_l1937_l1953_l1949_l1945_DUPLICATE_fd0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_9cee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_9cee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1940_l1937_l1924_l1953_l1949_l1945_DUPLICATE_8b32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1940_l1937_l1924_l1953_l1949_l1945_DUPLICATE_8b32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1940_l1937_l1924_l1953_l1949_l1945_DUPLICATE_8b32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1940_l1937_l1924_l1953_l1949_l1945_DUPLICATE_8b32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1940_l1937_l1924_l1953_l1949_l1945_DUPLICATE_8b32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1940_l1937_l1924_l1953_l1949_l1945_DUPLICATE_8b32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_8b1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_08b1_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_6105] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_6105] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1946_c3_2208] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_left;
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_return_output := BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_6105] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1954_c3_4872] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_left;
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_return_output := BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_6105] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_2208_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_4872_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_4b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_644d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1945_c7_0d05] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond;
     t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue;
     t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output := t16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_644d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1958_c21_7aeb] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_left;
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_return_output := BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_644d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1953_c7_6105] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1953_c7_6105_cond <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_cond;
     n16_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue;
     n16_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_return_output := n16_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_644d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1958_c21_719c_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_7aeb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_0d05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_0d05] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;

     -- t16_MUX[uxn_opcodes_h_l1940_c7_cc30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond;
     t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue;
     t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output := t16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;

     -- MUX[uxn_opcodes_h_l1958_c21_719c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1958_c21_719c_cond <= VAR_MUX_uxn_opcodes_h_l1958_c21_719c_cond;
     MUX_uxn_opcodes_h_l1958_c21_719c_iftrue <= VAR_MUX_uxn_opcodes_h_l1958_c21_719c_iftrue;
     MUX_uxn_opcodes_h_l1958_c21_719c_iffalse <= VAR_MUX_uxn_opcodes_h_l1958_c21_719c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1958_c21_719c_return_output := MUX_uxn_opcodes_h_l1958_c21_719c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_0d05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_0d05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;

     -- n16_MUX[uxn_opcodes_h_l1949_c7_644d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1949_c7_644d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_cond;
     n16_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue;
     n16_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_return_output := n16_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue := VAR_MUX_uxn_opcodes_h_l1958_c21_719c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;
     -- n16_MUX[uxn_opcodes_h_l1945_c7_0d05] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_cond;
     n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue;
     n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output := n16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_cc30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;

     -- t16_MUX[uxn_opcodes_h_l1937_c7_6782] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1937_c7_6782_cond <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_cond;
     t16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue;
     t16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output := t16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_cc30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_cc30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_cc30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_6105] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_return_output := result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_6105_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_6782] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;

     -- n16_MUX[uxn_opcodes_h_l1940_c7_cc30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_cond;
     n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue;
     n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output := n16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;

     -- t16_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_6782] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_6782] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_644d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_6782] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_644d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1937_c7_6782] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1937_c7_6782_cond <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_cond;
     n16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue;
     n16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output := n16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_0d05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output := result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_0d05_return_output;
     -- n16_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_cc30] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output := result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_cc30_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_6782] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_return_output := result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_6782_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_8b1f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1962_l1920_DUPLICATE_97be LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1962_l1920_DUPLICATE_97be_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_8b1f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1962_l1920_DUPLICATE_97be_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1962_l1920_DUPLICATE_97be_return_output;
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
