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
-- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_7928]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_e530]
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_e530]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_e530]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_e530]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_e530]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_e530]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_e530]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_e530]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_e530]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c2_e530]
signal n16_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c2_e530]
signal t16_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_c641]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_bd80]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_bd80]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_bd80]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_bd80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_bd80]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_bd80]
signal n16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1290_c7_bd80]
signal t16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_081f]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_bf7a]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_bf7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_bf7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_bf7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_bf7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_bf7a]
signal n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1293_c7_bf7a]
signal t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_df51]
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_d91f]
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_d91f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_d91f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_d91f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_d91f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1298_c7_d91f]
signal n16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1298_c7_d91f]
signal t16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1299_c3_529e]
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_c608]
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_1d62]
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_1d62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_1d62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_1d62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_1d62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1302_c7_1d62]
signal n16_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1305_c30_7f68]
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_2dae]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_0e42]
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_0e42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_0e42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_0e42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_0e42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_0e42]
signal n16_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1308_c3_4547]
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_8613]
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1312_c21_a99c]
signal MUX_uxn_opcodes_h_l1312_c21_a99c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_a99c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_a99c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_a99c_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c2_e530
n16_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
n16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c2_e530
t16_MUX_uxn_opcodes_h_l1277_c2_e530 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c2_e530_cond,
t16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_bd80
n16_MUX_uxn_opcodes_h_l1290_c7_bd80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output);

-- t16_MUX_uxn_opcodes_h_l1290_c7_bd80
t16_MUX_uxn_opcodes_h_l1290_c7_bd80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond,
t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue,
t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse,
t16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_bf7a
n16_MUX_uxn_opcodes_h_l1293_c7_bf7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output);

-- t16_MUX_uxn_opcodes_h_l1293_c7_bf7a
t16_MUX_uxn_opcodes_h_l1293_c7_bf7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond,
t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue,
t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse,
t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_left,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_right,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output);

-- n16_MUX_uxn_opcodes_h_l1298_c7_d91f
n16_MUX_uxn_opcodes_h_l1298_c7_d91f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond,
n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue,
n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse,
n16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output);

-- t16_MUX_uxn_opcodes_h_l1298_c7_d91f
t16_MUX_uxn_opcodes_h_l1298_c7_d91f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond,
t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue,
t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse,
t16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e
BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_left,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_right,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_left,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_right,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_cond,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output);

-- n16_MUX_uxn_opcodes_h_l1302_c7_1d62
n16_MUX_uxn_opcodes_h_l1302_c7_1d62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1302_c7_1d62_cond,
n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue,
n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse,
n16_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68
sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_ins,
sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_x,
sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_y,
sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_cond,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_0e42
n16_MUX_uxn_opcodes_h_l1307_c7_0e42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_0e42_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547
BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_left,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_right,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_left,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_right,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_return_output);

-- MUX_uxn_opcodes_h_l1312_c21_a99c
MUX_uxn_opcodes_h_l1312_c21_a99c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1312_c21_a99c_cond,
MUX_uxn_opcodes_h_l1312_c21_a99c_iftrue,
MUX_uxn_opcodes_h_l1312_c21_a99c_iffalse,
MUX_uxn_opcodes_h_l1312_c21_a99c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output,
 t16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output,
 t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output,
 n16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output,
 t16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output,
 n16_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output,
 sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_return_output,
 MUX_uxn_opcodes_h_l1312_c21_a99c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_6e57 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_6838 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_5555 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_03e5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_a608 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_970a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_2af0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1277_l1307_l1302_l1298_l1293_l1290_DUPLICATE_a5f7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_33fd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8883_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_72eb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5181_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_9519_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1273_l1316_DUPLICATE_22d5_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_970a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_970a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_03e5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_03e5;
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_a608 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_a608;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_5555 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_5555;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_6e57 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_6e57;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_6838 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_6838;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_2af0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_2af0;
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_iftrue := resize(to_unsigned(0, 1), 8);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_081f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_e530_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_df51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_left;
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output := BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_9519 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_9519_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_c641] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_72eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_72eb_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5181 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5181_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_33fd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_33fd_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_2dae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_e530_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_e530_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1277_l1307_l1302_l1298_l1293_l1290_DUPLICATE_a5f7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1277_l1307_l1302_l1298_l1293_l1290_DUPLICATE_a5f7_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_c608] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_left;
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output := BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_7928] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1305_c30_7f68] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_ins;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_x;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_return_output := sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_e530_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8883 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8883_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_7928_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_c641_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_081f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_df51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_c608_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2dae_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5181_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5181_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_33fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_33fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_33fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_33fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8883_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_72eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_72eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_72eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_72eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_72eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_9519_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_9519_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1277_l1307_l1302_l1298_l1293_l1290_DUPLICATE_a5f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1277_l1307_l1302_l1298_l1293_l1290_DUPLICATE_a5f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1277_l1307_l1302_l1298_l1293_l1290_DUPLICATE_a5f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1277_l1307_l1302_l1298_l1293_l1290_DUPLICATE_a5f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1277_l1307_l1302_l1298_l1293_l1290_DUPLICATE_a5f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1277_l1307_l1302_l1298_l1293_l1290_DUPLICATE_a5f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_e530_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_e530_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_e530_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_e530_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7f68_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_0e42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_0e42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1299_c3_529e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_left;
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_return_output := BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_0e42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1308_c3_4547] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_left;
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_return_output := BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_0e42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_529e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_4547_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f0f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_1d62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_0e42] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_0e42_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_1d62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_1d62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;

     -- t16_MUX[uxn_opcodes_h_l1298_c7_d91f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond;
     t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue;
     t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output := t16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_8613] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_left;
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_return_output := BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_1d62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_8613_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1302_c7_1d62] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1302_c7_1d62_cond <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_cond;
     n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue;
     n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output := n16_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;

     -- t16_MUX[uxn_opcodes_h_l1293_c7_bf7a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond;
     t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue;
     t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output := t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_d91f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_d91f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;

     -- MUX[uxn_opcodes_h_l1312_c21_a99c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1312_c21_a99c_cond <= VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_cond;
     MUX_uxn_opcodes_h_l1312_c21_a99c_iftrue <= VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_iftrue;
     MUX_uxn_opcodes_h_l1312_c21_a99c_iffalse <= VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_return_output := MUX_uxn_opcodes_h_l1312_c21_a99c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_d91f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_d91f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue := VAR_MUX_uxn_opcodes_h_l1312_c21_a99c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;
     -- t16_MUX[uxn_opcodes_h_l1290_c7_bd80] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond;
     t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue;
     t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output := t16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_bf7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_bf7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1298_c7_d91f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_cond;
     n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue;
     n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output := n16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_bf7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_0e42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output := result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_bf7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_0e42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_bd80] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;

     -- t16_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     t16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := t16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_bd80] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_bf7a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_1d62] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output := result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_bd80] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_bd80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_1d62_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_bd80] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_d91f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_d91f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     n16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := n16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_bf7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_bf7a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_bd80] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_bd80_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_e530] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_return_output := result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1273_l1316_DUPLICATE_22d5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1273_l1316_DUPLICATE_22d5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_e530_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1273_l1316_DUPLICATE_22d5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1273_l1316_DUPLICATE_22d5_return_output;
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
