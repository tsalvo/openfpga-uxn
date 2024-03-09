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
-- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_c6da]
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1198_c2_f385]
signal n16_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1198_c2_f385]
signal t16_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1198_c2_f385]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1198_c2_f385]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_f385]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_f385]
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_f385]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_f385]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1198_c2_f385]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1198_c2_f385]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_f385]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1211_c11_7776]
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1211_c7_35ac]
signal n16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1211_c7_35ac]
signal t16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1211_c7_35ac]
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1211_c7_35ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1211_c7_35ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1211_c7_35ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1211_c7_35ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_262b]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1214_c7_4da8]
signal n16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1214_c7_4da8]
signal t16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_4da8]
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_4da8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_4da8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_4da8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_4da8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_a7dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1219_c7_7ddc]
signal n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1219_c7_7ddc]
signal t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1219_c7_7ddc]
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_7ddc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_7ddc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1219_c7_7ddc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1219_c7_7ddc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1220_c3_6592]
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1223_c11_50d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1223_c7_3f82]
signal n16_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1223_c7_3f82]
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1223_c7_3f82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1223_c7_3f82]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1223_c7_3f82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1223_c7_3f82]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_22b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1227_c7_ebfb]
signal n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_ebfb]
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_ebfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_ebfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_ebfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_ebfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1228_c3_e251]
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1229_c30_635a]
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1232_c21_5224]
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1232_c21_51ec]
signal MUX_uxn_opcodes_h_l1232_c21_51ec_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_51ec_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_51ec_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_51ec_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_left,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_right,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output);

-- n16_MUX_uxn_opcodes_h_l1198_c2_f385
n16_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
n16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
n16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
n16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- t16_MUX_uxn_opcodes_h_l1198_c2_f385
t16_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
t16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
t16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
t16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_left,
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_right,
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output);

-- n16_MUX_uxn_opcodes_h_l1211_c7_35ac
n16_MUX_uxn_opcodes_h_l1211_c7_35ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond,
n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue,
n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse,
n16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output);

-- t16_MUX_uxn_opcodes_h_l1211_c7_35ac
t16_MUX_uxn_opcodes_h_l1211_c7_35ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond,
t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue,
t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse,
t16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output);

-- n16_MUX_uxn_opcodes_h_l1214_c7_4da8
n16_MUX_uxn_opcodes_h_l1214_c7_4da8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond,
n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue,
n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse,
n16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output);

-- t16_MUX_uxn_opcodes_h_l1214_c7_4da8
t16_MUX_uxn_opcodes_h_l1214_c7_4da8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond,
t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue,
t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse,
t16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output);

-- n16_MUX_uxn_opcodes_h_l1219_c7_7ddc
n16_MUX_uxn_opcodes_h_l1219_c7_7ddc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond,
n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue,
n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse,
n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output);

-- t16_MUX_uxn_opcodes_h_l1219_c7_7ddc
t16_MUX_uxn_opcodes_h_l1219_c7_7ddc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond,
t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue,
t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse,
t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592
BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_left,
BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_right,
BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output);

-- n16_MUX_uxn_opcodes_h_l1223_c7_3f82
n16_MUX_uxn_opcodes_h_l1223_c7_3f82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1223_c7_3f82_cond,
n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue,
n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse,
n16_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_cond,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output);

-- n16_MUX_uxn_opcodes_h_l1227_c7_ebfb
n16_MUX_uxn_opcodes_h_l1227_c7_ebfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond,
n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue,
n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse,
n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251
BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_left,
BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_right,
BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1229_c30_635a
sp_relative_shift_uxn_opcodes_h_l1229_c30_635a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_ins,
sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_x,
sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_y,
sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_left,
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_right,
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_return_output);

-- MUX_uxn_opcodes_h_l1232_c21_51ec
MUX_uxn_opcodes_h_l1232_c21_51ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1232_c21_51ec_cond,
MUX_uxn_opcodes_h_l1232_c21_51ec_iftrue,
MUX_uxn_opcodes_h_l1232_c21_51ec_iffalse,
MUX_uxn_opcodes_h_l1232_c21_51ec_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867
CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output,
 n16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 t16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output,
 n16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output,
 t16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output,
 n16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output,
 t16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output,
 n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output,
 t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output,
 n16_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output,
 n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_return_output,
 sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_return_output,
 MUX_uxn_opcodes_h_l1232_c21_51ec_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_b32f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_6f72 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_015a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_9823 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_1828 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_f748 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1198_l1227_DUPLICATE_452a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_5da4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_4895_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_6ba9_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1220_l1228_DUPLICATE_1192_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_5c58_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1194_l1236_DUPLICATE_54cc_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_9823 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_9823;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_015a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_015a;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_b32f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_b32f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_f748 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_f748;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_1828 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_1828;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_6f72 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_6f72;
     VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse := t16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_f385_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_5da4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_5da4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1211_c11_7776] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_left;
     BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output := BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1223_c11_50d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1198_l1227_DUPLICATE_452a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1198_l1227_DUPLICATE_452a_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1229_c30_635a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_ins;
     sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_x;
     sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_return_output := sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_6ba9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_6ba9_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_f385_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_c6da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_4895 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_4895_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_f385_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_22b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_5c58 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_5c58_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_a7dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_f385_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_262b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1220_l1228_DUPLICATE_1192 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1220_l1228_DUPLICATE_1192_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_c6da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_7776_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_262b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_a7dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_50d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_22b1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1220_l1228_DUPLICATE_1192_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1220_l1228_DUPLICATE_1192_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1224_l1220_l1228_DUPLICATE_1192_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_6ba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_6ba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_6ba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_6ba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_6ba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_5da4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_5da4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_5da4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_5da4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_5da4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_4895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_4895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_4895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_4895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1227_DUPLICATE_4895_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_5c58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_5c58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1198_l1227_DUPLICATE_452a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1198_l1227_DUPLICATE_452a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1198_l1227_DUPLICATE_452a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1198_l1227_DUPLICATE_452a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1198_l1227_DUPLICATE_452a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1223_l1219_l1214_l1211_l1198_l1227_DUPLICATE_452a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_f385_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_f385_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_f385_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_f385_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_635a_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_ebfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1228_c3_e251] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_left;
     BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_return_output := BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_ebfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_ebfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1220_c3_6592] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_left;
     BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_return_output := BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_ebfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_6592_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_e251_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_0867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;
     -- t16_MUX[uxn_opcodes_h_l1219_c7_7ddc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond;
     t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue;
     t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output := t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1223_c7_3f82] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1223_c7_3f82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1223_c7_3f82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1232_c21_5224] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_left;
     BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_return_output := BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1223_c7_3f82] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;

     -- n16_MUX[uxn_opcodes_h_l1227_c7_ebfb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond;
     n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue;
     n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output := n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_5224_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;
     -- t16_MUX[uxn_opcodes_h_l1214_c7_4da8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond;
     t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue;
     t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output := t16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1219_c7_7ddc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1219_c7_7ddc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;

     -- MUX[uxn_opcodes_h_l1232_c21_51ec] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1232_c21_51ec_cond <= VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_cond;
     MUX_uxn_opcodes_h_l1232_c21_51ec_iftrue <= VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_iftrue;
     MUX_uxn_opcodes_h_l1232_c21_51ec_iffalse <= VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_return_output := MUX_uxn_opcodes_h_l1232_c21_51ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_7ddc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1223_c7_3f82] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1223_c7_3f82_cond <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_cond;
     n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue;
     n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output := n16_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_7ddc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue := VAR_MUX_uxn_opcodes_h_l1232_c21_51ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_4da8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_4da8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_4da8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_ebfb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1219_c7_7ddc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond;
     n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue;
     n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output := n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1211_c7_35ac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond;
     t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue;
     t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output := t16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_4da8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_ebfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1211_c7_35ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;

     -- t16_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     t16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     t16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := t16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1211_c7_35ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1211_c7_35ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;

     -- n16_MUX[uxn_opcodes_h_l1214_c7_4da8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_cond;
     n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue;
     n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output := n16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1223_c7_3f82] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output := result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1211_c7_35ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_3f82_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1219_c7_7ddc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- n16_MUX[uxn_opcodes_h_l1211_c7_35ac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_cond;
     n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue;
     n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output := n16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_7ddc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_4da8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     n16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     n16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := n16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_4da8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1211_c7_35ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_35ac_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_f385] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_return_output := result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1194_l1236_DUPLICATE_54cc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1194_l1236_DUPLICATE_54cc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_f385_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_f385_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1194_l1236_DUPLICATE_54cc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1194_l1236_DUPLICATE_54cc_return_output;
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
