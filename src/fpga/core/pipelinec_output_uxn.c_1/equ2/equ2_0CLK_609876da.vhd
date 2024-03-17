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
entity equ2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_609876da;
architecture arch of equ2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_ac47]
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1198_c2_b4ae]
signal t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1211_c11_68ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1211_c7_9a96]
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1211_c7_9a96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1211_c7_9a96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1211_c7_9a96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1211_c7_9a96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1211_c7_9a96]
signal n16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1211_c7_9a96]
signal t16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_b70f]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_974a]
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_974a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_974a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_974a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_974a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1214_c7_974a]
signal n16_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1214_c7_974a]
signal t16_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_977b]
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1219_c7_372e]
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_372e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1219_c7_372e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1219_c7_372e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_372e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1219_c7_372e]
signal n16_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1219_c7_372e]
signal t16_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1220_c3_8935]
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1223_c11_4982]
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1223_c7_7ea7]
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1223_c7_7ea7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1223_c7_7ea7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1223_c7_7ea7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1223_c7_7ea7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1223_c7_7ea7]
signal n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_4f2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_d544]
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_d544]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_d544]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_d544]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_d544]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1227_c7_d544]
signal n16_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1228_c3_4ca8]
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1229_c30_86e8]
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1232_c21_0727]
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1232_c21_6a76]
signal MUX_uxn_opcodes_h_l1232_c21_6a76_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_6a76_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_6a76_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_6a76_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_left,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_right,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- n16_MUX_uxn_opcodes_h_l1198_c2_b4ae
n16_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- t16_MUX_uxn_opcodes_h_l1198_c2_b4ae
t16_MUX_uxn_opcodes_h_l1198_c2_b4ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond,
t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue,
t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse,
t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_cond,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output);

-- n16_MUX_uxn_opcodes_h_l1211_c7_9a96
n16_MUX_uxn_opcodes_h_l1211_c7_9a96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond,
n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue,
n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse,
n16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output);

-- t16_MUX_uxn_opcodes_h_l1211_c7_9a96
t16_MUX_uxn_opcodes_h_l1211_c7_9a96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond,
t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue,
t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse,
t16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_return_output);

-- n16_MUX_uxn_opcodes_h_l1214_c7_974a
n16_MUX_uxn_opcodes_h_l1214_c7_974a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1214_c7_974a_cond,
n16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue,
n16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse,
n16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output);

-- t16_MUX_uxn_opcodes_h_l1214_c7_974a
t16_MUX_uxn_opcodes_h_l1214_c7_974a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1214_c7_974a_cond,
t16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue,
t16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse,
t16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_left,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_right,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_return_output);

-- n16_MUX_uxn_opcodes_h_l1219_c7_372e
n16_MUX_uxn_opcodes_h_l1219_c7_372e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1219_c7_372e_cond,
n16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue,
n16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse,
n16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output);

-- t16_MUX_uxn_opcodes_h_l1219_c7_372e
t16_MUX_uxn_opcodes_h_l1219_c7_372e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1219_c7_372e_cond,
t16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue,
t16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse,
t16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935
BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_left,
BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_right,
BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_left,
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_right,
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output);

-- n16_MUX_uxn_opcodes_h_l1223_c7_7ea7
n16_MUX_uxn_opcodes_h_l1223_c7_7ea7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond,
n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue,
n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse,
n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_cond,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_return_output);

-- n16_MUX_uxn_opcodes_h_l1227_c7_d544
n16_MUX_uxn_opcodes_h_l1227_c7_d544 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1227_c7_d544_cond,
n16_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue,
n16_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse,
n16_MUX_uxn_opcodes_h_l1227_c7_d544_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8
BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_left,
BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_right,
BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8
sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_ins,
sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_x,
sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_y,
sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_left,
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_right,
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_return_output);

-- MUX_uxn_opcodes_h_l1232_c21_6a76
MUX_uxn_opcodes_h_l1232_c21_6a76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1232_c21_6a76_cond,
MUX_uxn_opcodes_h_l1232_c21_6a76_iftrue,
MUX_uxn_opcodes_h_l1232_c21_6a76_iffalse,
MUX_uxn_opcodes_h_l1232_c21_6a76_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28
CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output,
 n16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output,
 t16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_return_output,
 n16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output,
 t16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_return_output,
 n16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output,
 t16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output,
 n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_return_output,
 n16_MUX_uxn_opcodes_h_l1227_c7_d544_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_return_output,
 sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_return_output,
 MUX_uxn_opcodes_h_l1232_c21_6a76_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_86e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_24c6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_a6ef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_8df6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_7480 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_25c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1211_l1198_l1227_l1223_l1219_l1214_DUPLICATE_7d43_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_a74e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_cba1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_2b32_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1228_l1220_DUPLICATE_1cad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_d13b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1236_l1194_DUPLICATE_1d20_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_24c6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_24c6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_25c4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_25c4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_a6ef := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_a6ef;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_8df6 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_8df6;
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_86e8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_86e8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_7480 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_7480;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l1229_c30_86e8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_ins;
     sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_x;
     sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_return_output := sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1228_l1220_DUPLICATE_1cad LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1228_l1220_DUPLICATE_1cad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_cba1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_cba1_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_a74e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_a74e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_4f2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_b70f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_ac47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_left;
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output := BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1211_c11_68ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1223_c11_4982] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_left;
     BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output := BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1211_l1198_l1227_l1223_l1219_l1214_DUPLICATE_7d43 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1211_l1198_l1227_l1223_l1219_l1214_DUPLICATE_7d43_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_977b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_d13b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_d13b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_2b32 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_2b32_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_ac47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_68ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_b70f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_977b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_4982_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_4f2f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1228_l1220_DUPLICATE_1cad_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1228_l1220_DUPLICATE_1cad_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1228_l1220_DUPLICATE_1cad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_cba1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_cba1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_cba1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_cba1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_cba1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_2b32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_2b32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_2b32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_2b32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_2b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_a74e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_a74e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_a74e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_a74e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1211_l1227_l1223_l1219_l1214_DUPLICATE_a74e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_d13b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_d13b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1211_l1198_l1227_l1223_l1219_l1214_DUPLICATE_7d43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1211_l1198_l1227_l1223_l1219_l1214_DUPLICATE_7d43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1211_l1198_l1227_l1223_l1219_l1214_DUPLICATE_7d43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1211_l1198_l1227_l1223_l1219_l1214_DUPLICATE_7d43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1211_l1198_l1227_l1223_l1219_l1214_DUPLICATE_7d43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1211_l1198_l1227_l1223_l1219_l1214_DUPLICATE_7d43_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_b4ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_86e8_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1220_c3_8935] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_left;
     BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_return_output := BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_d544] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_d544] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_d544] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1228_c3_4ca8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_left;
     BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_return_output := BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_d544] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_8935_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_4ca8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_fd28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1223_c7_7ea7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1227_c7_d544] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1227_c7_d544_cond <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_cond;
     n16_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue;
     n16_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_return_output := n16_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1232_c21_0727] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_left;
     BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_return_output := BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1223_c7_7ea7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1223_c7_7ea7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1219_c7_372e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1219_c7_372e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_cond;
     t16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue;
     t16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output := t16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1223_c7_7ea7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_0727_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_372e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1223_c7_7ea7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond;
     n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue;
     n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output := n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_372e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1219_c7_372e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;

     -- MUX[uxn_opcodes_h_l1232_c21_6a76] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1232_c21_6a76_cond <= VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_cond;
     MUX_uxn_opcodes_h_l1232_c21_6a76_iftrue <= VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_iftrue;
     MUX_uxn_opcodes_h_l1232_c21_6a76_iffalse <= VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_return_output := MUX_uxn_opcodes_h_l1232_c21_6a76_return_output;

     -- t16_MUX[uxn_opcodes_h_l1214_c7_974a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1214_c7_974a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_cond;
     t16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue;
     t16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output := t16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1219_c7_372e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue := VAR_MUX_uxn_opcodes_h_l1232_c21_6a76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_d544] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_return_output := result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;

     -- t16_MUX[uxn_opcodes_h_l1211_c7_9a96] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond;
     t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue;
     t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output := t16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_974a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1219_c7_372e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1219_c7_372e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_cond;
     n16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue;
     n16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output := n16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_974a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_974a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_974a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_d544_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1211_c7_9a96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1223_c7_7ea7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1211_c7_9a96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1211_c7_9a96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;

     -- n16_MUX[uxn_opcodes_h_l1214_c7_974a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1214_c7_974a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_cond;
     n16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue;
     n16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output := n16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1211_c7_9a96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_7ea7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1211_c7_9a96] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_cond;
     n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue;
     n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output := n16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1219_c7_372e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_372e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_974a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_974a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1211_c7_9a96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output := result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_9a96_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_b4ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1236_l1194_DUPLICATE_1d20 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1236_l1194_DUPLICATE_1d20_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_b4ae_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1236_l1194_DUPLICATE_1d20_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1236_l1194_DUPLICATE_1d20_return_output;
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
