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
-- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_8deb]
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1924_c2_1832]
signal n16_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1924_c2_1832]
signal t16_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_1832]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_1832]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_1832]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_1832]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_1832]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_1832]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_1832]
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_1832]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_1832]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_b520]
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1937_c7_4e5b]
signal n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1937_c7_4e5b]
signal t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_4e5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_4e5b]
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_4e5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_4e5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_4e5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_a937]
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1940_c7_c56d]
signal n16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1940_c7_c56d]
signal t16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_c56d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_c56d]
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_c56d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_c56d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_c56d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_93dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1945_c7_c38b]
signal n16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1945_c7_c38b]
signal t16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_c38b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_c38b]
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_c38b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_c38b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_c38b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1946_c3_86e3]
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_f0c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1949_c7_b740]
signal n16_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_b740]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_b740]
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_b740]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_b740]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_b740]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_10c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1953_c7_734f]
signal n16_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_734f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_734f]
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_734f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_734f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_734f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1954_c3_9072]
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1955_c30_365a]
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1958_c21_605c]
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1958_c21_008c]
signal MUX_uxn_opcodes_h_l1958_c21_008c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_008c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_008c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1958_c21_008c_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_left,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_right,
BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output);

-- n16_MUX_uxn_opcodes_h_l1924_c2_1832
n16_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
n16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
n16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
n16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- t16_MUX_uxn_opcodes_h_l1924_c2_1832
t16_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
t16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
t16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
t16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_left,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_right,
BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output);

-- n16_MUX_uxn_opcodes_h_l1937_c7_4e5b
n16_MUX_uxn_opcodes_h_l1937_c7_4e5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond,
n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue,
n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse,
n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output);

-- t16_MUX_uxn_opcodes_h_l1937_c7_4e5b
t16_MUX_uxn_opcodes_h_l1937_c7_4e5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond,
t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue,
t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse,
t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_left,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_right,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output);

-- n16_MUX_uxn_opcodes_h_l1940_c7_c56d
n16_MUX_uxn_opcodes_h_l1940_c7_c56d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond,
n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue,
n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse,
n16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output);

-- t16_MUX_uxn_opcodes_h_l1940_c7_c56d
t16_MUX_uxn_opcodes_h_l1940_c7_c56d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond,
t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue,
t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse,
t16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output);

-- n16_MUX_uxn_opcodes_h_l1945_c7_c38b
n16_MUX_uxn_opcodes_h_l1945_c7_c38b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond,
n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue,
n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse,
n16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output);

-- t16_MUX_uxn_opcodes_h_l1945_c7_c38b
t16_MUX_uxn_opcodes_h_l1945_c7_c38b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond,
t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue,
t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse,
t16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3
BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_left,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_right,
BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output);

-- n16_MUX_uxn_opcodes_h_l1949_c7_b740
n16_MUX_uxn_opcodes_h_l1949_c7_b740 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1949_c7_b740_cond,
n16_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue,
n16_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse,
n16_MUX_uxn_opcodes_h_l1949_c7_b740_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_cond,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output);

-- n16_MUX_uxn_opcodes_h_l1953_c7_734f
n16_MUX_uxn_opcodes_h_l1953_c7_734f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1953_c7_734f_cond,
n16_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue,
n16_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse,
n16_MUX_uxn_opcodes_h_l1953_c7_734f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072
BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_left,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_right,
BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1955_c30_365a
sp_relative_shift_uxn_opcodes_h_l1955_c30_365a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_ins,
sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_x,
sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_y,
sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c
BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_left,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_right,
BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_return_output);

-- MUX_uxn_opcodes_h_l1958_c21_008c
MUX_uxn_opcodes_h_l1958_c21_008c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1958_c21_008c_cond,
MUX_uxn_opcodes_h_l1958_c21_008c_iftrue,
MUX_uxn_opcodes_h_l1958_c21_008c_iffalse,
MUX_uxn_opcodes_h_l1958_c21_008c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output,
 n16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 t16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output,
 n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output,
 t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output,
 n16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output,
 t16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output,
 n16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output,
 t16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output,
 n16_MUX_uxn_opcodes_h_l1949_c7_b740_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output,
 n16_MUX_uxn_opcodes_h_l1953_c7_734f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_return_output,
 sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_return_output,
 MUX_uxn_opcodes_h_l1958_c21_008c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_a2be : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_ae66 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_9834 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_3bce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_0748 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_30a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_008c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_008c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_008c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1958_c21_008c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_ba3e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_f24c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_0b3b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d393_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1950_l1954_l1946_DUPLICATE_efe3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_01ee_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1962_l1920_DUPLICATE_ad06_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_3bce := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_3bce;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_a2be := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1929_c3_a2be;
     VAR_MUX_uxn_opcodes_h_l1958_c21_008c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_0748 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1947_c3_0748;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_9834 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_9834;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l1958_c21_008c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_ae66 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_ae66;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_30a4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_30a4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse := t16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_1832_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_ba3e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_ba3e_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_f24c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_f24c_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_1832_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1955_c30_365a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_ins;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_x;
     sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_return_output := sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_1832_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_93dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1950_l1954_l1946_DUPLICATE_efe3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1950_l1954_l1946_DUPLICATE_efe3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_01ee LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_01ee_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1949_c11_f0c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1937_c11_b520] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_left;
     BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output := BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_1832_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d393 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d393_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_0b3b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_0b3b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_a937] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_left;
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output := BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1924_c6_8deb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1953_c11_10c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1924_c6_8deb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1937_c11_b520_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_a937_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_93dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c11_f0c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1953_c11_10c2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1950_l1954_l1946_DUPLICATE_efe3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1950_l1954_l1946_DUPLICATE_efe3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1941_l1950_l1954_l1946_DUPLICATE_efe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_f24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_d393_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_0b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_0b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_0b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_0b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_DUPLICATE_0b3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_01ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1949_l1953_DUPLICATE_01ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_ba3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_ba3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_ba3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_ba3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_ba3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1953_l1949_l1945_l1940_l1937_l1924_DUPLICATE_ba3e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1924_c2_1832_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1924_c2_1832_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1924_c2_1832_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1924_c2_1832_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1955_c30_365a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1953_c7_734f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1953_c7_734f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1953_c7_734f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1946_c3_86e3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_left;
     BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_return_output := BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1953_c7_734f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1954_c3_9072] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_left;
     BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_return_output := BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1946_c3_86e3_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1954_c3_9072_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1951_l1942_DUPLICATE_9ed9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c7_b740] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c7_b740] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;

     -- t16_MUX[uxn_opcodes_h_l1945_c7_c38b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond;
     t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue;
     t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output := t16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1958_c21_605c] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_left;
     BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_return_output := BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c7_b740] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c7_b740] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;

     -- n16_MUX[uxn_opcodes_h_l1953_c7_734f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1953_c7_734f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_cond;
     n16_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue;
     n16_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_return_output := n16_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1958_c21_008c_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1958_c21_605c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;
     -- t16_MUX[uxn_opcodes_h_l1940_c7_c56d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond;
     t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue;
     t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output := t16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_c38b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;

     -- MUX[uxn_opcodes_h_l1958_c21_008c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1958_c21_008c_cond <= VAR_MUX_uxn_opcodes_h_l1958_c21_008c_cond;
     MUX_uxn_opcodes_h_l1958_c21_008c_iftrue <= VAR_MUX_uxn_opcodes_h_l1958_c21_008c_iftrue;
     MUX_uxn_opcodes_h_l1958_c21_008c_iffalse <= VAR_MUX_uxn_opcodes_h_l1958_c21_008c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1958_c21_008c_return_output := MUX_uxn_opcodes_h_l1958_c21_008c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c7_c38b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_c38b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_c38b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1949_c7_b740] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1949_c7_b740_cond <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_cond;
     n16_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue;
     n16_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_return_output := n16_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue := VAR_MUX_uxn_opcodes_h_l1958_c21_008c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_c56d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_c56d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1937_c7_4e5b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond;
     t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue;
     t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output := t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1945_c7_c38b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_cond;
     n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue;
     n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output := n16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_c56d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_c56d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1953_c7_734f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1953_c7_734f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1937_c7_4e5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1937_c7_4e5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1949_c7_b740] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_return_output := result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;

     -- t16_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     t16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     t16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := t16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1937_c7_4e5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1940_c7_c56d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_cond;
     n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue;
     n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output := n16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1937_c7_4e5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1949_c7_b740_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_c38b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- n16_MUX[uxn_opcodes_h_l1937_c7_4e5b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond;
     n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue;
     n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output := n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_c38b_return_output;
     -- n16_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     n16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     n16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := n16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_c56d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_c56d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1937_c7_4e5b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1937_c7_4e5b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1924_c2_1832] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_return_output := result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1962_l1920_DUPLICATE_ad06 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1962_l1920_DUPLICATE_ad06_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1924_c2_1832_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1924_c2_1832_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1962_l1920_DUPLICATE_ad06_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1962_l1920_DUPLICATE_ad06_return_output;
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
