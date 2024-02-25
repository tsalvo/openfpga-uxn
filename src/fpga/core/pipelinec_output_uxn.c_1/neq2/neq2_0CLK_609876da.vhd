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
entity neq2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_609876da;
architecture arch of neq2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_27a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal t16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal n16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_f43f]
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_c6f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1290_c7_b641]
signal t16_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_b641]
signal n16_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_b641]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_b641]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_b641]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_b641]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_b641]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_e639]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1293_c7_7de3]
signal t16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_7de3]
signal n16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_7de3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_7de3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_7de3]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_7de3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_7de3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_cffb]
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1298_c7_f8f4]
signal t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1298_c7_f8f4]
signal n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_f8f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_f8f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_f8f4]
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_f8f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_f8f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1299_c3_fb01]
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_8438]
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1302_c7_d7dc]
signal n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_d7dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_d7dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_d7dc]
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_d7dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_d7dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1305_c30_5463]
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_f80d]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_2c1a]
signal n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_2c1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_2c1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_2c1a]
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_2c1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_2c1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1308_c3_131b]
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_9291]
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1312_c21_12e3]
signal MUX_uxn_opcodes_h_l1312_c21_12e3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_12e3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_12e3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_12e3_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c2_f43f
t16_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c2_f43f
n16_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output);

-- t16_MUX_uxn_opcodes_h_l1290_c7_b641
t16_MUX_uxn_opcodes_h_l1290_c7_b641 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1290_c7_b641_cond,
t16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue,
t16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse,
t16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_b641
n16_MUX_uxn_opcodes_h_l1290_c7_b641 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_b641_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output);

-- t16_MUX_uxn_opcodes_h_l1293_c7_7de3
t16_MUX_uxn_opcodes_h_l1293_c7_7de3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond,
t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue,
t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse,
t16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_7de3
n16_MUX_uxn_opcodes_h_l1293_c7_7de3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_left,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_right,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output);

-- t16_MUX_uxn_opcodes_h_l1298_c7_f8f4
t16_MUX_uxn_opcodes_h_l1298_c7_f8f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond,
t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue,
t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse,
t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output);

-- n16_MUX_uxn_opcodes_h_l1298_c7_f8f4
n16_MUX_uxn_opcodes_h_l1298_c7_f8f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond,
n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue,
n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse,
n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01
BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_left,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_right,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_left,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_right,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output);

-- n16_MUX_uxn_opcodes_h_l1302_c7_d7dc
n16_MUX_uxn_opcodes_h_l1302_c7_d7dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond,
n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue,
n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse,
n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1305_c30_5463
sp_relative_shift_uxn_opcodes_h_l1305_c30_5463 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_ins,
sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_x,
sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_y,
sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_2c1a
n16_MUX_uxn_opcodes_h_l1307_c7_2c1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b
BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_left,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_right,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_left,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_right,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_return_output);

-- MUX_uxn_opcodes_h_l1312_c21_12e3
MUX_uxn_opcodes_h_l1312_c21_12e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1312_c21_12e3_cond,
MUX_uxn_opcodes_h_l1312_c21_12e3_iftrue,
MUX_uxn_opcodes_h_l1312_c21_12e3_iffalse,
MUX_uxn_opcodes_h_l1312_c21_12e3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output,
 t16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output,
 t16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output,
 t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output,
 n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output,
 n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_return_output,
 MUX_uxn_opcodes_h_l1312_c21_12e3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_542c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_10eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_964b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_6d24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_2b47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_07e7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_72f3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1290_l1277_l1307_l1302_l1298_l1293_DUPLICATE_eb01_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_90ae_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_2ebe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_d564_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1308_l1294_DUPLICATE_58d2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_2c77_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1316_l1273_DUPLICATE_9f1e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_72f3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_72f3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_07e7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_07e7;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_964b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_964b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_2b47 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_2b47;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_542c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_542c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_10eb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_10eb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_6d24 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_6d24;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse := t16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_2ebe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_2ebe_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1290_l1277_l1307_l1302_l1298_l1293_DUPLICATE_eb01 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1290_l1277_l1307_l1302_l1298_l1293_DUPLICATE_eb01_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_f80d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_c6f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_90ae LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_90ae_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_8438] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_left;
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output := BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_2c77 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_2c77_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_27a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_d564 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_d564_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_cffb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1308_l1294_DUPLICATE_58d2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1308_l1294_DUPLICATE_58d2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_e639] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1305_c30_5463] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_ins;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_x;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_return_output := sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_27a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c6f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e639_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_cffb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8438_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f80d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1308_l1294_DUPLICATE_58d2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1308_l1294_DUPLICATE_58d2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1308_l1294_DUPLICATE_58d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_90ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_90ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_90ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_90ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_d564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_d564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_d564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_d564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_d564_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_2ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_2ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_2ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_2ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1290_l1307_l1302_l1298_l1293_DUPLICATE_2ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_2c77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_2c77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1290_l1277_l1307_l1302_l1298_l1293_DUPLICATE_eb01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1290_l1277_l1307_l1302_l1298_l1293_DUPLICATE_eb01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1290_l1277_l1307_l1302_l1298_l1293_DUPLICATE_eb01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1290_l1277_l1307_l1302_l1298_l1293_DUPLICATE_eb01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1290_l1277_l1307_l1302_l1298_l1293_DUPLICATE_eb01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1290_l1277_l1307_l1302_l1298_l1293_DUPLICATE_eb01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_f43f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_5463_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_2c1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_2c1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1299_c3_fb01] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_left;
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_return_output := BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_2c1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1308_c3_131b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_left;
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_return_output := BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_2c1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_fb01_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_131b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_312c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_d7dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_d7dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_2c1a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1298_c7_f8f4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond;
     t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue;
     t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output := t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_d7dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_9291] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_left;
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_return_output := BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_d7dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_9291_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_f8f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_f8f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1293_c7_7de3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond;
     t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue;
     t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output := t16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_f8f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;

     -- MUX[uxn_opcodes_h_l1312_c21_12e3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1312_c21_12e3_cond <= VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_cond;
     MUX_uxn_opcodes_h_l1312_c21_12e3_iftrue <= VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_iftrue;
     MUX_uxn_opcodes_h_l1312_c21_12e3_iffalse <= VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_return_output := MUX_uxn_opcodes_h_l1312_c21_12e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_f8f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1302_c7_d7dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond;
     n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue;
     n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output := n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue := VAR_MUX_uxn_opcodes_h_l1312_c21_12e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_7de3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_7de3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1290_c7_b641] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1290_c7_b641_cond <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_cond;
     t16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue;
     t16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output := t16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_2c1a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_7de3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_7de3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1298_c7_f8f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond;
     n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue;
     n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output := n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_2c1a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_d7dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_b641] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_b641] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;

     -- t16_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := t16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_b641] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_7de3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_b641] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_d7dc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_b641] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_b641_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_f8f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f8f4_return_output;
     -- n16_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := n16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_7de3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_7de3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_b641] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_b641_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_f43f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1316_l1273_DUPLICATE_9f1e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1316_l1273_DUPLICATE_9f1e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_f43f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1316_l1273_DUPLICATE_9f1e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1316_l1273_DUPLICATE_9f1e_return_output;
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
