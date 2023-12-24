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
-- BIN_OP_EQ[uxn_opcodes_h_l1411_c6_d521]
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1411_c2_e745]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1411_c2_e745]
signal tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1411_c2_e745]
signal t16_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1424_c11_b514]
signal BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1424_c7_fbbc]
signal result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1424_c7_fbbc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1424_c7_fbbc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1424_c7_fbbc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1424_c7_fbbc]
signal result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1424_c7_fbbc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1424_c7_fbbc]
signal tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1424_c7_fbbc]
signal t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_fc38]
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1427_c7_ffdd]
signal result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_ffdd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1427_c7_ffdd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_ffdd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_ffdd]
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_ffdd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1427_c7_ffdd]
signal tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1427_c7_ffdd]
signal t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1429_c3_b561]
signal CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_2aa5]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1431_c7_7824]
signal result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_7824]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_7824]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_7824]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1431_c7_7824]
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_7824]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1431_c7_7824]
signal tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1431_c7_7824]
signal t16_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1432_c3_a6ea]
signal BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1433_c30_c7af]
signal sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1436_c11_01db]
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c7_baf5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c7_baf5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c7_baf5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1436_c7_baf5]
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c7_baf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1436_c7_baf5]
signal tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_a96d]
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_36b9]
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_36b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_36b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_36b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1439_c7_36b9]
signal tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_775a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521
BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_left,
BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_right,
BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1411_c2_e745
tmp8_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- t16_MUX_uxn_opcodes_h_l1411_c2_e745
t16_MUX_uxn_opcodes_h_l1411_c2_e745 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1411_c2_e745_cond,
t16_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue,
t16_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse,
t16_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514
BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_left,
BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_right,
BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc
tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond,
tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue,
tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse,
tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output);

-- t16_MUX_uxn_opcodes_h_l1424_c7_fbbc
t16_MUX_uxn_opcodes_h_l1424_c7_fbbc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond,
t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue,
t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse,
t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_left,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_right,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd
tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond,
tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue,
tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse,
tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output);

-- t16_MUX_uxn_opcodes_h_l1427_c7_ffdd
t16_MUX_uxn_opcodes_h_l1427_c7_ffdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond,
t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue,
t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse,
t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1429_c3_b561
CONST_SL_8_uxn_opcodes_h_l1429_c3_b561 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_x,
CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond,
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond,
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1431_c7_7824
tmp8_MUX_uxn_opcodes_h_l1431_c7_7824 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_cond,
tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue,
tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse,
tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_return_output);

-- t16_MUX_uxn_opcodes_h_l1431_c7_7824
t16_MUX_uxn_opcodes_h_l1431_c7_7824 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1431_c7_7824_cond,
t16_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue,
t16_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse,
t16_MUX_uxn_opcodes_h_l1431_c7_7824_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea
BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_left,
BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_right,
BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af
sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_ins,
sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_x,
sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_y,
sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_left,
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_right,
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5
tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_cond,
tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_left,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_right,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9
tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_cond,
tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue,
tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse,
tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 t16_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output,
 tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output,
 t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output,
 tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output,
 t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output,
 CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_return_output,
 tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_return_output,
 t16_MUX_uxn_opcodes_h_l1431_c7_7824_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_return_output,
 sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output,
 tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output,
 tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1416_c3_e8f5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1421_c3_9216 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_2f49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1437_c3_7664 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_1d40 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1411_l1439_l1436_DUPLICATE_cccc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_9748_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_7648_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_588f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_5354_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1432_DUPLICATE_ccf7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_e217_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1447_l1406_DUPLICATE_29d0_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_1d40 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_1d40;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1437_c3_7664 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1437_c3_7664;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1421_c3_9216 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1421_c3_9216;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_2f49 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_2f49;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1416_c3_e8f5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1416_c3_e8f5;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_fc38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_left;
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output := BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1411_c2_e745_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_5354 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_5354_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1432_DUPLICATE_ccf7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1432_DUPLICATE_ccf7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1411_c2_e745_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_a96d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_7648 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_7648_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_588f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_588f_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1411_c2_e745_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1411_l1439_l1436_DUPLICATE_cccc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1411_l1439_l1436_DUPLICATE_cccc_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_e217 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_e217_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1433_c30_c7af] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_ins;
     sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_x;
     sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_return_output := sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_9748 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_9748_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1436_c11_01db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1411_c6_d521] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_left;
     BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output := BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_2aa5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1424_c11_b514] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_left;
     BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output := BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1411_c2_e745_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_d521_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_b514_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_fc38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_01db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_a96d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1432_DUPLICATE_ccf7_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1432_DUPLICATE_ccf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_7648_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_7648_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_7648_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_9748_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_9748_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_9748_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_9748_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_5354_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_5354_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_5354_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_5354_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_5354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_588f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_588f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_588f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_588f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1439_l1436_DUPLICATE_588f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_e217_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_e217_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_e217_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_e217_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1411_l1439_l1436_DUPLICATE_cccc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1411_l1439_l1436_DUPLICATE_cccc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1411_l1439_l1436_DUPLICATE_cccc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1411_l1439_l1436_DUPLICATE_cccc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1411_l1439_l1436_DUPLICATE_cccc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1431_l1427_l1424_l1411_l1439_l1436_DUPLICATE_cccc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1411_c2_e745_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1411_c2_e745_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1411_c2_e745_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1411_c2_e745_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_c7af_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c7_baf5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1429_c3_b561] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_return_output := CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1439_c7_36b9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_cond;
     tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output := tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_36b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_36b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1432_c3_a6ea] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_left;
     BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_return_output := BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_36b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_36b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_a6ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_b561_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_36b9_return_output;
     -- t16_MUX[uxn_opcodes_h_l1431_c7_7824] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1431_c7_7824_cond <= VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_cond;
     t16_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue;
     t16_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_return_output := t16_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1431_c7_7824] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output := result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c7_baf5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_7824] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1436_c7_baf5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c7_baf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1436_c7_baf5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_cond;
     tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output := tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c7_baf5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_baf5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_7824] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1427_c7_ffdd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1427_c7_ffdd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond;
     t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue;
     t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output := t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1427_c7_ffdd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1431_c7_7824] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_cond;
     tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_return_output := tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1431_c7_7824] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output := result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_7824] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_7824] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_7824_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_ffdd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_ffdd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_ffdd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_ffdd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1424_c7_fbbc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond;
     t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue;
     t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output := t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1427_c7_ffdd] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_cond;
     tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output := tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1424_c7_fbbc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1424_c7_fbbc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_ffdd_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- t16_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     t16_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     t16_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := t16_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1424_c7_fbbc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1424_c7_fbbc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1424_c7_fbbc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1424_c7_fbbc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1424_c7_fbbc] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_cond;
     tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output := tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_fbbc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c2_e745] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_e745_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1447_l1406_DUPLICATE_29d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1447_l1406_DUPLICATE_29d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_e745_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_e745_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1447_l1406_DUPLICATE_29d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1447_l1406_DUPLICATE_29d0_return_output;
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
