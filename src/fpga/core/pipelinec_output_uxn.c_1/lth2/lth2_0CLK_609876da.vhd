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
-- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_ed32]
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1924_c2_7562]
signal t16_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1924_c2_7562]
signal n16_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_7562]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_7562]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_7562]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_7562]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_7562]
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_7562]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_7562]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_7562]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_7562]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_59ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1937_c7_045a]
signal t16_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1937_c7_045a]
signal n16_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_045a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_045a]
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_045a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_045a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_045a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_56fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1940_c7_f73e]
signal t16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1940_c7_f73e]
signal n16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_f73e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_f73e]
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_f73e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_f73e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_f73e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_a41e]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1945_c7_da3d]
signal t16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1945_c7_da3d]
signal n16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_da3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_da3d]
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_da3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_da3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_da3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1946_c3_4eb3]
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_27e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1949_c7_0cfa]
signal n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_0cfa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_0cfa]
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_0cfa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_0cfa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_0cfa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_181b]
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1953_c7_fca9]
signal n16_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_fca9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_fca9]
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_fca9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_fca9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_fca9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1954_c3_72ce]
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1955_c30_6508]
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1958_c21_04c0]
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1958_c21_c3d4]
signal MUX_uxn_opcodes_h_l1958_c21_c3d4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_c3d4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_c3d4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_c3d4_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_left,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_right,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output);

-- t16_MUX_uxn_opcodes_h_l1924_c2_7562
t16_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
t16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
t16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
t16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- n16_MUX_uxn_opcodes_h_l1924_c2_7562
n16_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
n16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
n16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
n16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output);

-- t16_MUX_uxn_opcodes_h_l1937_c7_045a
t16_MUX_uxn_opcodes_h_l1937_c7_045a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1937_c7_045a_cond,
t16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue,
t16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse,
t16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output);

-- n16_MUX_uxn_opcodes_h_l1937_c7_045a
n16_MUX_uxn_opcodes_h_l1937_c7_045a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1937_c7_045a_cond,
n16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue,
n16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse,
n16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output);

-- t16_MUX_uxn_opcodes_h_l1940_c7_f73e
t16_MUX_uxn_opcodes_h_l1940_c7_f73e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond,
t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue,
t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse,
t16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output);

-- n16_MUX_uxn_opcodes_h_l1940_c7_f73e
n16_MUX_uxn_opcodes_h_l1940_c7_f73e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond,
n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue,
n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse,
n16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output);

-- t16_MUX_uxn_opcodes_h_l1945_c7_da3d
t16_MUX_uxn_opcodes_h_l1945_c7_da3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond,
t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue,
t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse,
t16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output);

-- n16_MUX_uxn_opcodes_h_l1945_c7_da3d
n16_MUX_uxn_opcodes_h_l1945_c7_da3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond,
n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue,
n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse,
n16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3
BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_left,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_right,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output);

-- n16_MUX_uxn_opcodes_h_l1949_c7_0cfa
n16_MUX_uxn_opcodes_h_l1949_c7_0cfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond,
n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue,
n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse,
n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_left,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_right,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output);

-- n16_MUX_uxn_opcodes_h_l1953_c7_fca9
n16_MUX_uxn_opcodes_h_l1953_c7_fca9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1953_c7_fca9_cond,
n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue,
n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse,
n16_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce
BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_left,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_right,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1955_c30_6508
sp_relative_shift_uxn_opcodes_h_l1955_c30_6508 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_ins,
sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_x,
sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_y,
sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0
BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_left,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_right,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_return_output);

-- MUX_uxn_opcodes_h_l1958_c21_c3d4
MUX_uxn_opcodes_h_l1958_c21_c3d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1958_c21_c3d4_cond,
MUX_uxn_opcodes_h_l1958_c21_c3d4_iftrue,
MUX_uxn_opcodes_h_l1958_c21_c3d4_iffalse,
MUX_uxn_opcodes_h_l1958_c21_c3d4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output,
 t16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 n16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output,
 t16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output,
 n16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output,
 t16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output,
 n16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output,
 t16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output,
 n16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output,
 n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output,
 n16_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_return_output,
 sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_return_output,
 MUX_uxn_opcodes_h_l1958_c21_c3d4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_aa50 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_2721 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_aa65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_4927 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_c72c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_e6ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6f44_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_01ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_5004_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d612_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1946_l1950_l1954_DUPLICATE_d24a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_7290_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1962_l1920_DUPLICATE_cbbd_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_aa65 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_aa65;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_4927 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_4927;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_e6ff := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_e6ff;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_c72c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_c72c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_aa50 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_aa50;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_2721 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_2721;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_59ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_ed32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_left;
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output := BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_181b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_7562_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_7290 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_7290_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d612 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d612_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_7562_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1955_c30_6508] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_ins;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_x;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_return_output := sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_7562_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6f44 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6f44_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_56fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_7562_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_27e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1946_l1950_l1954_DUPLICATE_d24a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1946_l1950_l1954_DUPLICATE_d24a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_5004 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_5004_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_a41e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_01ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_01ab_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_ed32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_59ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_56fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_a41e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_27e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_181b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1946_l1950_l1954_DUPLICATE_d24a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1946_l1950_l1954_DUPLICATE_d24a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1946_l1950_l1954_DUPLICATE_d24a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_5004_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_5004_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_5004_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_5004_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_5004_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d612_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d612_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d612_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d612_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d612_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_01ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_01ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_01ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_01ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_01ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_7290_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_7290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6f44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6f44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6f44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6f44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6f44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6f44_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_7562_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_7562_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_7562_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_7562_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_6508_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_fca9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1954_c3_72ce] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_left;
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_return_output := BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_fca9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_fca9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1946_c3_4eb3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_left;
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_return_output := BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_fca9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_4eb3_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_72ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_ed7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_0cfa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1958_c21_04c0] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_left;
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_return_output := BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_0cfa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1953_c7_fca9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1953_c7_fca9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_cond;
     n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue;
     n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output := n16_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_0cfa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;

     -- t16_MUX[uxn_opcodes_h_l1945_c7_da3d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond;
     t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue;
     t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output := t16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_0cfa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_04c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_da3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_da3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;

     -- MUX[uxn_opcodes_h_l1958_c21_c3d4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1958_c21_c3d4_cond <= VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_cond;
     MUX_uxn_opcodes_h_l1958_c21_c3d4_iftrue <= VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_iftrue;
     MUX_uxn_opcodes_h_l1958_c21_c3d4_iffalse <= VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_return_output := MUX_uxn_opcodes_h_l1958_c21_c3d4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1940_c7_f73e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond;
     t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue;
     t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output := t16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_da3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_da3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1949_c7_0cfa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond;
     n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue;
     n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output := n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue := VAR_MUX_uxn_opcodes_h_l1958_c21_c3d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1937_c7_045a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1937_c7_045a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_cond;
     t16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue;
     t16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output := t16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1945_c7_da3d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_cond;
     n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue;
     n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output := n16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_f73e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_f73e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_fca9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_f73e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_f73e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fca9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_045a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_0cfa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_045a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     t16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     t16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := t16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_045a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_045a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1940_c7_f73e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_cond;
     n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue;
     n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output := n16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_0cfa_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_da3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- n16_MUX[uxn_opcodes_h_l1937_c7_045a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1937_c7_045a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_cond;
     n16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue;
     n16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output := n16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_da3d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_f73e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     n16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     n16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := n16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_f73e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_045a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_045a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_7562] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_return_output := result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1962_l1920_DUPLICATE_cbbd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1962_l1920_DUPLICATE_cbbd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_7562_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_7562_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1962_l1920_DUPLICATE_cbbd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1962_l1920_DUPLICATE_cbbd_return_output;
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
