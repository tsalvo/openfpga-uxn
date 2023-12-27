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
-- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_7c70]
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal t16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1924_c2_c2db]
signal n16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_6711]
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_98e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_98e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_98e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_98e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_98e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1937_c7_98e3]
signal t16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1937_c7_98e3]
signal n16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_85bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_ca2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_ca2f]
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_ca2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_ca2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_ca2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1940_c7_ca2f]
signal t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1940_c7_ca2f]
signal n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_69d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_7563]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_7563]
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_7563]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_7563]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_7563]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1945_c7_7563]
signal t16_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1945_c7_7563]
signal n16_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1946_c3_df4e]
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_11f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_7c23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_7c23]
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_7c23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_7c23]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_7c23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1949_c7_7c23]
signal n16_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_2b68]
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_fa95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_fa95]
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_fa95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_fa95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_fa95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1953_c7_fa95]
signal n16_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1954_c3_9fe0]
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1955_c30_502c]
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1958_c21_0838]
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1958_c21_ad09]
signal MUX_uxn_opcodes_h_l1958_c21_ad09_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_ad09_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_ad09_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_ad09_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_left,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_right,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- t16_MUX_uxn_opcodes_h_l1924_c2_c2db
t16_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
t16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- n16_MUX_uxn_opcodes_h_l1924_c2_c2db
n16_MUX_uxn_opcodes_h_l1924_c2_c2db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond,
n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue,
n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse,
n16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_left,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_right,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output);

-- t16_MUX_uxn_opcodes_h_l1937_c7_98e3
t16_MUX_uxn_opcodes_h_l1937_c7_98e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond,
t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue,
t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse,
t16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output);

-- n16_MUX_uxn_opcodes_h_l1937_c7_98e3
n16_MUX_uxn_opcodes_h_l1937_c7_98e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond,
n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue,
n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse,
n16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output);

-- t16_MUX_uxn_opcodes_h_l1940_c7_ca2f
t16_MUX_uxn_opcodes_h_l1940_c7_ca2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond,
t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue,
t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse,
t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output);

-- n16_MUX_uxn_opcodes_h_l1940_c7_ca2f
n16_MUX_uxn_opcodes_h_l1940_c7_ca2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond,
n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue,
n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse,
n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_cond,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_return_output);

-- t16_MUX_uxn_opcodes_h_l1945_c7_7563
t16_MUX_uxn_opcodes_h_l1945_c7_7563 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1945_c7_7563_cond,
t16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue,
t16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse,
t16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output);

-- n16_MUX_uxn_opcodes_h_l1945_c7_7563
n16_MUX_uxn_opcodes_h_l1945_c7_7563 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1945_c7_7563_cond,
n16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue,
n16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse,
n16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e
BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_left,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_right,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_cond,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output);

-- n16_MUX_uxn_opcodes_h_l1949_c7_7c23
n16_MUX_uxn_opcodes_h_l1949_c7_7c23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1949_c7_7c23_cond,
n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue,
n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse,
n16_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_left,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_right,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_cond,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output);

-- n16_MUX_uxn_opcodes_h_l1953_c7_fa95
n16_MUX_uxn_opcodes_h_l1953_c7_fa95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1953_c7_fa95_cond,
n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue,
n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse,
n16_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0
BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_left,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_right,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1955_c30_502c
sp_relative_shift_uxn_opcodes_h_l1955_c30_502c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_ins,
sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_x,
sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_y,
sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838
BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_left,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_right,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_return_output);

-- MUX_uxn_opcodes_h_l1958_c21_ad09
MUX_uxn_opcodes_h_l1958_c21_ad09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1958_c21_ad09_cond,
MUX_uxn_opcodes_h_l1958_c21_ad09_iftrue,
MUX_uxn_opcodes_h_l1958_c21_ad09_iffalse,
MUX_uxn_opcodes_h_l1958_c21_ad09_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 t16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 n16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output,
 t16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output,
 n16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output,
 t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output,
 n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_return_output,
 t16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output,
 n16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output,
 n16_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output,
 n16_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_return_output,
 MUX_uxn_opcodes_h_l1958_c21_ad09_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_2df7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_35e0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_b7da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_6f93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_57fb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_a273 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6705_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_731c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_e3f5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_9dca_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1941_l1950_l1954_DUPLICATE_48d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_91db_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1962_l1920_DUPLICATE_43db_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_2df7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_2df7;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_57fb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_57fb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_35e0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_35e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_b7da := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_b7da;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_6f93 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_6f93;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_a273 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_a273;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse := t16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_731c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_731c_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_91db LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_91db_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1941_l1950_l1954_DUPLICATE_48d8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1941_l1950_l1954_DUPLICATE_48d8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_85bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_e3f5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_e3f5_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_9dca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_9dca_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_2b68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_left;
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output := BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_69d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1955_c30_502c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_ins;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_x;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_return_output := sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_7c70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_left;
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output := BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6705 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6705_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_6711] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_left;
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output := BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_11f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_7c70_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_6711_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_85bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_69d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_11f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_2b68_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1941_l1950_l1954_DUPLICATE_48d8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1941_l1950_l1954_DUPLICATE_48d8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1946_l1941_l1950_l1954_DUPLICATE_48d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_e3f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_e3f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_e3f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_e3f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_e3f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_9dca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_9dca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_9dca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_9dca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_9dca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_731c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_731c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_731c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_731c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_731c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_91db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1953_l1949_DUPLICATE_91db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6705_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6705_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6705_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6705_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6705_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_6705_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_c2db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_502c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_fa95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1946_c3_df4e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_left;
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_return_output := BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1954_c3_9fe0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_left;
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_return_output := BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_fa95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_fa95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_fa95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_df4e_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9fe0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1942_l1951_DUPLICATE_82a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;
     -- n16_MUX[uxn_opcodes_h_l1953_c7_fa95] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1953_c7_fa95_cond <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_cond;
     n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue;
     n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output := n16_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_7c23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_7c23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_7c23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_7c23] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;

     -- t16_MUX[uxn_opcodes_h_l1945_c7_7563] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1945_c7_7563_cond <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_cond;
     t16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue;
     t16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output := t16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1958_c21_0838] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_left;
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_return_output := BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_0838_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;
     -- n16_MUX[uxn_opcodes_h_l1949_c7_7c23] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1949_c7_7c23_cond <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_cond;
     n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue;
     n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output := n16_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;

     -- MUX[uxn_opcodes_h_l1958_c21_ad09] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1958_c21_ad09_cond <= VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_cond;
     MUX_uxn_opcodes_h_l1958_c21_ad09_iftrue <= VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_iftrue;
     MUX_uxn_opcodes_h_l1958_c21_ad09_iffalse <= VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_return_output := MUX_uxn_opcodes_h_l1958_c21_ad09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_7563] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_7563] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;

     -- t16_MUX[uxn_opcodes_h_l1940_c7_ca2f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond;
     t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue;
     t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output := t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_7563] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_7563] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue := VAR_MUX_uxn_opcodes_h_l1958_c21_ad09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1945_c7_7563] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1945_c7_7563_cond <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_cond;
     n16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue;
     n16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output := n16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_ca2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_ca2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_fa95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output := result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;

     -- t16_MUX[uxn_opcodes_h_l1937_c7_98e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond;
     t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue;
     t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output := t16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_ca2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_ca2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_fa95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;
     -- t16_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := t16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_98e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_7c23] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output := result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_98e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_98e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_98e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1940_c7_ca2f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond;
     n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue;
     n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output := n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_7c23_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_7563] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_return_output := result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;

     -- n16_MUX[uxn_opcodes_h_l1937_c7_98e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_cond;
     n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue;
     n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output := n16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_7563_return_output;
     -- n16_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := n16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_ca2f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_ca2f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_98e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_98e3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_c2db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output := result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1962_l1920_DUPLICATE_43db LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1962_l1920_DUPLICATE_43db_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_c2db_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1962_l1920_DUPLICATE_43db_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1962_l1920_DUPLICATE_43db_return_output;
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
