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
entity lth2_0CLK_977cbcae is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_977cbcae;
architecture arch of lth2_0CLK_977cbcae is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1925_c6_5ca3]
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1925_c2_d6f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_61e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1938_c7_5431]
signal n16_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1938_c7_5431]
signal t16_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1938_c7_5431]
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_5431]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_5431]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_5431]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_5431]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_4f44]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1941_c7_375f]
signal n16_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1941_c7_375f]
signal t16_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1941_c7_375f]
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_375f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_375f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c7_375f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c7_375f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_52ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1946_c7_66b1]
signal n16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1946_c7_66b1]
signal t16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1946_c7_66b1]
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_66b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_66b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1946_c7_66b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1946_c7_66b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1947_c3_4386]
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1950_c11_b430]
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1950_c7_e876]
signal n16_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1950_c7_e876]
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1950_c7_e876]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1950_c7_e876]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1950_c7_e876]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1950_c7_e876]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_342c]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1954_c7_f49a]
signal n16_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_f49a]
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_f49a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_f49a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_f49a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_f49a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1955_c3_5abc]
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1956_c30_21d3]
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1959_c21_4f2b]
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1959_c21_5b18]
signal MUX_uxn_opcodes_h_l1959_c21_5b18_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_5b18_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_5b18_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_5b18_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_left,
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_right,
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output);

-- n16_MUX_uxn_opcodes_h_l1925_c2_d6f6
n16_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- t16_MUX_uxn_opcodes_h_l1925_c2_d6f6
t16_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output);

-- n16_MUX_uxn_opcodes_h_l1938_c7_5431
n16_MUX_uxn_opcodes_h_l1938_c7_5431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1938_c7_5431_cond,
n16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue,
n16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse,
n16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output);

-- t16_MUX_uxn_opcodes_h_l1938_c7_5431
t16_MUX_uxn_opcodes_h_l1938_c7_5431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1938_c7_5431_cond,
t16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue,
t16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse,
t16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_cond,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output);

-- n16_MUX_uxn_opcodes_h_l1941_c7_375f
n16_MUX_uxn_opcodes_h_l1941_c7_375f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1941_c7_375f_cond,
n16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue,
n16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse,
n16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output);

-- t16_MUX_uxn_opcodes_h_l1941_c7_375f
t16_MUX_uxn_opcodes_h_l1941_c7_375f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1941_c7_375f_cond,
t16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue,
t16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse,
t16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output);

-- n16_MUX_uxn_opcodes_h_l1946_c7_66b1
n16_MUX_uxn_opcodes_h_l1946_c7_66b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond,
n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue,
n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse,
n16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output);

-- t16_MUX_uxn_opcodes_h_l1946_c7_66b1
t16_MUX_uxn_opcodes_h_l1946_c7_66b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond,
t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue,
t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse,
t16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386
BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_left,
BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_right,
BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_left,
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_right,
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output);

-- n16_MUX_uxn_opcodes_h_l1950_c7_e876
n16_MUX_uxn_opcodes_h_l1950_c7_e876 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1950_c7_e876_cond,
n16_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue,
n16_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse,
n16_MUX_uxn_opcodes_h_l1950_c7_e876_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_cond,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output);

-- n16_MUX_uxn_opcodes_h_l1954_c7_f49a
n16_MUX_uxn_opcodes_h_l1954_c7_f49a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1954_c7_f49a_cond,
n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue,
n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse,
n16_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc
BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_left,
BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_right,
BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3
sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_ins,
sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_x,
sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_y,
sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b
BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_left,
BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_right,
BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_return_output);

-- MUX_uxn_opcodes_h_l1959_c21_5b18
MUX_uxn_opcodes_h_l1959_c21_5b18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1959_c21_5b18_cond,
MUX_uxn_opcodes_h_l1959_c21_5b18_iftrue,
MUX_uxn_opcodes_h_l1959_c21_5b18_iffalse,
MUX_uxn_opcodes_h_l1959_c21_5b18_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output,
 n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output,
 n16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output,
 t16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output,
 n16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output,
 t16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output,
 n16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output,
 t16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output,
 n16_MUX_uxn_opcodes_h_l1950_c7_e876_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output,
 n16_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_return_output,
 MUX_uxn_opcodes_h_l1959_c21_5b18_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_3f6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_a585 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_d99e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_065c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_40c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_927d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1941_l1938_l1925_l1954_l1950_l1946_DUPLICATE_6a10_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_bc47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_3960_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_041f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1955_l1942_DUPLICATE_6f1c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_c823_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1921_l1963_DUPLICATE_46d5_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_927d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_927d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_d99e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_d99e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_40c7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_40c7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_a585 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_a585;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_3f6d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_3f6d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_065c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_065c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1925_c6_5ca3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1955_l1942_DUPLICATE_6f1c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1955_l1942_DUPLICATE_6f1c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_61e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1941_l1938_l1925_l1954_l1950_l1946_DUPLICATE_6a10 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1941_l1938_l1925_l1954_l1950_l1946_DUPLICATE_6a10_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1950_c11_b430] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_left;
     BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output := BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_c823 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_c823_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_52ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_4f44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_bc47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_bc47_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1956_c30_21d3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_ins;
     sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_x;
     sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_return_output := sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_041f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_041f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_3960 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_3960_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_342c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_5ca3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_61e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_4f44_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_52ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_b430_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_342c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1955_l1942_DUPLICATE_6f1c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1955_l1942_DUPLICATE_6f1c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1947_l1955_l1942_DUPLICATE_6f1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_041f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_041f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_041f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_041f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_041f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_bc47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_bc47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_bc47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_bc47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_bc47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_3960_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_3960_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_3960_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_3960_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1938_l1954_l1950_l1946_DUPLICATE_3960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_c823_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_c823_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1941_l1938_l1925_l1954_l1950_l1946_DUPLICATE_6a10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1941_l1938_l1925_l1954_l1950_l1946_DUPLICATE_6a10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1941_l1938_l1925_l1954_l1950_l1946_DUPLICATE_6a10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1941_l1938_l1925_l1954_l1950_l1946_DUPLICATE_6a10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1941_l1938_l1925_l1954_l1950_l1946_DUPLICATE_6a10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1941_l1938_l1925_l1954_l1950_l1946_DUPLICATE_6a10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_d6f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_21d3_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1955_c3_5abc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_left;
     BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_return_output := BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1947_c3_4386] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_left;
     BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_return_output := BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_f49a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_f49a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_f49a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_f49a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_4386_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_5abc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_b52f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;
     -- BIN_OP_LT[uxn_opcodes_h_l1959_c21_4f2b] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_left;
     BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_return_output := BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1946_c7_66b1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond;
     t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue;
     t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output := t16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1950_c7_e876] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;

     -- n16_MUX[uxn_opcodes_h_l1954_c7_f49a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1954_c7_f49a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_cond;
     n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue;
     n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output := n16_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1950_c7_e876] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1950_c7_e876] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1950_c7_e876] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_4f2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1946_c7_66b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_66b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;

     -- MUX[uxn_opcodes_h_l1959_c21_5b18] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1959_c21_5b18_cond <= VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_cond;
     MUX_uxn_opcodes_h_l1959_c21_5b18_iftrue <= VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_iftrue;
     MUX_uxn_opcodes_h_l1959_c21_5b18_iffalse <= VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_return_output := MUX_uxn_opcodes_h_l1959_c21_5b18_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_66b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1950_c7_e876] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1950_c7_e876_cond <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_cond;
     n16_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue;
     n16_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_return_output := n16_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;

     -- t16_MUX[uxn_opcodes_h_l1941_c7_375f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1941_c7_375f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_cond;
     t16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue;
     t16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output := t16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1946_c7_66b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue := VAR_MUX_uxn_opcodes_h_l1959_c21_5b18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1946_c7_66b1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_cond;
     n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue;
     n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output := n16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_f49a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c7_375f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c7_375f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_375f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1938_c7_5431] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1938_c7_5431_cond <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_cond;
     t16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue;
     t16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output := t16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_375f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_f49a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_5431] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_5431] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1950_c7_e876] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_return_output := result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_5431] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;

     -- t16_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_5431] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;

     -- n16_MUX[uxn_opcodes_h_l1941_c7_375f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1941_c7_375f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_cond;
     n16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue;
     n16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output := n16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_e876_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1946_c7_66b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1938_c7_5431] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1938_c7_5431_cond <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_cond;
     n16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue;
     n16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output := n16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_66b1_return_output;
     -- n16_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1941_c7_375f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_375f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1938_c7_5431] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_return_output := result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_5431_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1925_c2_d6f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1921_l1963_DUPLICATE_46d5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1921_l1963_DUPLICATE_46d5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_d6f6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1921_l1963_DUPLICATE_46d5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1921_l1963_DUPLICATE_46d5_return_output;
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
