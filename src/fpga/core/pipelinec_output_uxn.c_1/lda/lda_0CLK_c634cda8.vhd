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
entity lda_0CLK_c634cda8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_c634cda8;
architecture arch of lda_0CLK_c634cda8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1395_c6_eebd]
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1395_c2_34fa]
signal t16_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1408_c11_8aaf]
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1408_c7_e016]
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1408_c7_e016]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1408_c7_e016]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1408_c7_e016]
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1408_c7_e016]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1408_c7_e016]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1408_c7_e016]
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1408_c7_e016]
signal t16_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_4885]
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1411_c7_ae08]
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_ae08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_ae08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1411_c7_ae08]
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_ae08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_ae08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1411_c7_ae08]
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1411_c7_ae08]
signal t16_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1413_c3_7b12]
signal CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_44d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_8bfb]
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_8bfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_8bfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1415_c7_8bfb]
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_8bfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_8bfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1415_c7_8bfb]
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1415_c7_8bfb]
signal t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1416_c3_aef2]
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1417_c30_5a3a]
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_1277]
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1420_c7_92a9]
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_92a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_92a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_92a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_92a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1420_c7_92a9]
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_ff07]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_3261]
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_3261]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_3261]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_3261]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1423_c7_3261]
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_18d4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_left,
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_right,
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa
tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- t16_MUX_uxn_opcodes_h_l1395_c2_34fa
t16_MUX_uxn_opcodes_h_l1395_c2_34fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1395_c2_34fa_cond,
t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue,
t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse,
t16_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_left,
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_right,
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1408_c7_e016
tmp8_MUX_uxn_opcodes_h_l1408_c7_e016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_cond,
tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue,
tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse,
tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_return_output);

-- t16_MUX_uxn_opcodes_h_l1408_c7_e016
t16_MUX_uxn_opcodes_h_l1408_c7_e016 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1408_c7_e016_cond,
t16_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue,
t16_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse,
t16_MUX_uxn_opcodes_h_l1408_c7_e016_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_left,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_right,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08
tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_cond,
tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue,
tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse,
tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output);

-- t16_MUX_uxn_opcodes_h_l1411_c7_ae08
t16_MUX_uxn_opcodes_h_l1411_c7_ae08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1411_c7_ae08_cond,
t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue,
t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse,
t16_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12
CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_x,
CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb
tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond,
tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue,
tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse,
tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output);

-- t16_MUX_uxn_opcodes_h_l1415_c7_8bfb
t16_MUX_uxn_opcodes_h_l1415_c7_8bfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond,
t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue,
t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse,
t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2
BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_left,
BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_right,
BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a
sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_ins,
sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_x,
sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_y,
sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_left,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_right,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9
tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_cond,
tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue,
tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse,
tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_cond,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1423_c7_3261
tmp8_MUX_uxn_opcodes_h_l1423_c7_3261 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_cond,
tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue,
tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse,
tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 t16_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_return_output,
 tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_return_output,
 t16_MUX_uxn_opcodes_h_l1408_c7_e016_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output,
 tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output,
 t16_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output,
 CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output,
 tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output,
 t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_return_output,
 sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output,
 tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_return_output,
 tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_0f07 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_29f3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_4c28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_9062 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_ecc9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1408_l1395_l1423_l1420_l1415_l1411_DUPLICATE_11a8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1408_l1411_l1395_l1415_DUPLICATE_c9b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_999f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_07ed_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_276f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_3e8c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1420_l1411_l1423_l1415_DUPLICATE_42e6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1431_l1390_DUPLICATE_0d99_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_0f07 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_0f07;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_ecc9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_ecc9;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_29f3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_29f3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_4c28 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_4c28;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_9062 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_9062;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := to_unsigned(0, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse := tmp8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_07ed LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_07ed_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1408_c11_8aaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1417_c30_5a3a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_ins;
     sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_x;
     sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_return_output := sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_999f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_999f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_276f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_276f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1395_c6_eebd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_1277] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_left;
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output := BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_ff07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_44d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1408_l1411_l1395_l1415_DUPLICATE_c9b6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1408_l1411_l1395_l1415_DUPLICATE_c9b6_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_3e8c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_3e8c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1420_l1411_l1423_l1415_DUPLICATE_42e6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1420_l1411_l1423_l1415_DUPLICATE_42e6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_4885] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_left;
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output := BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1408_l1395_l1423_l1420_l1415_l1411_DUPLICATE_11a8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1408_l1395_l1423_l1420_l1415_l1411_DUPLICATE_11a8_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_eebd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_8aaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_4885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_44d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_1277_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ff07_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_3e8c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_3e8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_07ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_07ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_07ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1408_l1411_l1395_l1415_DUPLICATE_c9b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1408_l1411_l1395_l1415_DUPLICATE_c9b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1408_l1411_l1395_l1415_DUPLICATE_c9b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1408_l1411_l1395_l1415_DUPLICATE_c9b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_276f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_999f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_999f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_999f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_999f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1408_l1423_l1420_l1415_l1411_DUPLICATE_999f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1420_l1411_l1423_l1415_DUPLICATE_42e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1420_l1411_l1423_l1415_DUPLICATE_42e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1420_l1411_l1423_l1415_DUPLICATE_42e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1420_l1411_l1423_l1415_DUPLICATE_42e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1408_l1395_l1423_l1420_l1415_l1411_DUPLICATE_11a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1408_l1395_l1423_l1420_l1415_l1411_DUPLICATE_11a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1408_l1395_l1423_l1420_l1415_l1411_DUPLICATE_11a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1408_l1395_l1423_l1420_l1415_l1411_DUPLICATE_11a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1408_l1395_l1423_l1420_l1415_l1411_DUPLICATE_11a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1408_l1395_l1423_l1420_l1415_l1411_DUPLICATE_11a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_34fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_5a3a_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_3261] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1416_c3_aef2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_left;
     BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_return_output := BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1413_c3_7b12] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_return_output := CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_92a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1423_c7_3261] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_cond;
     tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_return_output := tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_3261] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_3261] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_return_output := result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_3261] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_aef2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_7b12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_3261_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1420_c7_92a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_92a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1415_c7_8bfb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond;
     t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue;
     t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output := t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1415_c7_8bfb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_92a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_92a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_8bfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1420_c7_92a9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_cond;
     tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output := tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_92a9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1411_c7_ae08] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output := result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_8bfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_ae08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;

     -- t16_MUX[uxn_opcodes_h_l1411_c7_ae08] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1411_c7_ae08_cond <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_cond;
     t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue;
     t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output := t16_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1415_c7_8bfb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond;
     tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output := tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_8bfb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_8bfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_8bfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_8bfb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1408_c7_e016] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output := result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1408_c7_e016] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_ae08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_ae08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1411_c7_ae08] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_cond;
     tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output := tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1411_c7_ae08] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output := result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_ae08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;

     -- t16_MUX[uxn_opcodes_h_l1408_c7_e016] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1408_c7_e016_cond <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_cond;
     t16_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue;
     t16_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_return_output := t16_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_ae08_return_output;
     -- t16_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := t16_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1408_c7_e016] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1408_c7_e016] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1408_c7_e016] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1408_c7_e016] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output := result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1408_c7_e016] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_cond;
     tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_return_output := tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_e016_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c2_34fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1431_l1390_DUPLICATE_0d99 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1431_l1390_DUPLICATE_0d99_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_18d4(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_34fa_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1431_l1390_DUPLICATE_0d99_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1431_l1390_DUPLICATE_0d99_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
