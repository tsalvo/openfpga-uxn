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
-- BIN_OP_EQ[uxn_opcodes_h_l1300_c6_e47e]
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal t16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal n16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1300_c2_ba69]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_ad73]
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1313_c7_6858]
signal t16_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1313_c7_6858]
signal n16_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_6858]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1313_c7_6858]
signal result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1313_c7_6858]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_6858]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_6858]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1316_c11_5cab]
signal BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1316_c7_d221]
signal t16_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1316_c7_d221]
signal n16_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1316_c7_d221]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1316_c7_d221]
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1316_c7_d221]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1316_c7_d221]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1316_c7_d221]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1321_c11_c0ea]
signal BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1321_c7_b6a7]
signal t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1321_c7_b6a7]
signal n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1321_c7_b6a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1321_c7_b6a7]
signal result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1321_c7_b6a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1321_c7_b6a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1321_c7_b6a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1322_c3_a812]
signal BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_09df]
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1325_c7_7234]
signal n16_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_7234]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1325_c7_7234]
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1325_c7_7234]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1325_c7_7234]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_7234]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1328_c30_efc6]
signal sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1330_c11_8492]
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1330_c7_49d6]
signal n16_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c7_49d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1330_c7_49d6]
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c7_49d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c7_49d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c7_49d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1331_c3_4f70]
signal BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1335_c21_f914]
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1335_c21_5852]
signal MUX_uxn_opcodes_h_l1335_c21_5852_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1335_c21_5852_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1335_c21_5852_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1335_c21_5852_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e
BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_left,
BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_right,
BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output);

-- t16_MUX_uxn_opcodes_h_l1300_c2_ba69
t16_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
t16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- n16_MUX_uxn_opcodes_h_l1300_c2_ba69
n16_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
n16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_left,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_right,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output);

-- t16_MUX_uxn_opcodes_h_l1313_c7_6858
t16_MUX_uxn_opcodes_h_l1313_c7_6858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1313_c7_6858_cond,
t16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue,
t16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse,
t16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output);

-- n16_MUX_uxn_opcodes_h_l1313_c7_6858
n16_MUX_uxn_opcodes_h_l1313_c7_6858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1313_c7_6858_cond,
n16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue,
n16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse,
n16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_cond,
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_left,
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_right,
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output);

-- t16_MUX_uxn_opcodes_h_l1316_c7_d221
t16_MUX_uxn_opcodes_h_l1316_c7_d221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1316_c7_d221_cond,
t16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue,
t16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse,
t16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output);

-- n16_MUX_uxn_opcodes_h_l1316_c7_d221
n16_MUX_uxn_opcodes_h_l1316_c7_d221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1316_c7_d221_cond,
n16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue,
n16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse,
n16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_cond,
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_left,
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_right,
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output);

-- t16_MUX_uxn_opcodes_h_l1321_c7_b6a7
t16_MUX_uxn_opcodes_h_l1321_c7_b6a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond,
t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue,
t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse,
t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output);

-- n16_MUX_uxn_opcodes_h_l1321_c7_b6a7
n16_MUX_uxn_opcodes_h_l1321_c7_b6a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond,
n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue,
n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse,
n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812
BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_left,
BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_right,
BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_left,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_right,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output);

-- n16_MUX_uxn_opcodes_h_l1325_c7_7234
n16_MUX_uxn_opcodes_h_l1325_c7_7234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1325_c7_7234_cond,
n16_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue,
n16_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse,
n16_MUX_uxn_opcodes_h_l1325_c7_7234_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_cond,
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6
sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_ins,
sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_x,
sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_y,
sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_left,
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_right,
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output);

-- n16_MUX_uxn_opcodes_h_l1330_c7_49d6
n16_MUX_uxn_opcodes_h_l1330_c7_49d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1330_c7_49d6_cond,
n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue,
n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse,
n16_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70
BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_left,
BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_right,
BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914
BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_left,
BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_right,
BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_return_output);

-- MUX_uxn_opcodes_h_l1335_c21_5852
MUX_uxn_opcodes_h_l1335_c21_5852 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1335_c21_5852_cond,
MUX_uxn_opcodes_h_l1335_c21_5852_iftrue,
MUX_uxn_opcodes_h_l1335_c21_5852_iffalse,
MUX_uxn_opcodes_h_l1335_c21_5852_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec
CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output,
 t16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 n16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output,
 t16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output,
 n16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output,
 t16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output,
 n16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output,
 t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output,
 n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output,
 n16_MUX_uxn_opcodes_h_l1325_c7_7234_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_return_output,
 sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output,
 n16_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_return_output,
 MUX_uxn_opcodes_h_l1335_c21_5852_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1305_c3_1299 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1310_c3_ba98 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_9bb0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1319_c3_ced7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1323_c3_afc0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1332_c3_c98b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1334_c3_f68a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c21_5852_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c21_5852_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c21_5852_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c21_5852_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1300_l1330_l1325_DUPLICATE_0269_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_3ada_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1321_l1313_l1316_DUPLICATE_1eba_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_0ae9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1331_l1322_l1317_l1326_DUPLICATE_6882_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1330_l1325_DUPLICATE_8a9a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1339_l1296_DUPLICATE_2994_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1335_c21_5852_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1310_c3_ba98 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1310_c3_ba98;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1335_c21_5852_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1334_c3_f68a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1334_c3_f68a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1332_c3_c98b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1332_c3_c98b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1323_c3_afc0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1323_c3_afc0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_9bb0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_9bb0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_y := resize(to_signed(-3, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1305_c3_1299 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1305_c3_1299;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1319_c3_ced7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1319_c3_ced7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l1328_c30_efc6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_ins;
     sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_x;
     sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_return_output := sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1316_c11_5cab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_ad73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1330_l1325_DUPLICATE_8a9a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1330_l1325_DUPLICATE_8a9a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_09df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1321_c11_c0ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1300_c6_e47e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_3ada LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_3ada_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1321_l1313_l1316_DUPLICATE_1eba LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1321_l1313_l1316_DUPLICATE_1eba_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1300_l1330_l1325_DUPLICATE_0269 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1300_l1330_l1325_DUPLICATE_0269_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_0ae9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_0ae9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1330_c11_8492] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_left;
     BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output := BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1331_l1322_l1317_l1326_DUPLICATE_6882 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1331_l1322_l1317_l1326_DUPLICATE_6882_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_e47e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_ad73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_5cab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_c0ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_09df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_8492_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1331_l1322_l1317_l1326_DUPLICATE_6882_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1331_l1322_l1317_l1326_DUPLICATE_6882_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1331_l1322_l1317_l1326_DUPLICATE_6882_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1321_l1313_l1316_DUPLICATE_1eba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1321_l1313_l1316_DUPLICATE_1eba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1321_l1313_l1316_DUPLICATE_1eba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1321_l1313_l1316_DUPLICATE_1eba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_3ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_3ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_3ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_3ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_3ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_0ae9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_0ae9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_0ae9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_0ae9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1330_l1325_DUPLICATE_0ae9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1330_l1325_DUPLICATE_8a9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1330_l1325_DUPLICATE_8a9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1300_l1330_l1325_DUPLICATE_0269_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1300_l1330_l1325_DUPLICATE_0269_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1300_l1330_l1325_DUPLICATE_0269_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1300_l1330_l1325_DUPLICATE_0269_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1300_l1330_l1325_DUPLICATE_0269_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1321_l1316_l1313_l1300_l1330_l1325_DUPLICATE_0269_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1300_c2_ba69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_efc6_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1322_c3_a812] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_left;
     BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_return_output := BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c7_49d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c7_49d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1331_c3_4f70] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_left;
     BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_return_output := BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c7_49d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c7_49d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_a812_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_4f70_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1327_l1318_DUPLICATE_7fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;
     -- n16_MUX[uxn_opcodes_h_l1330_c7_49d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1330_c7_49d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_cond;
     n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue;
     n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output := n16_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1335_c21_f914] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_left;
     BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_return_output := BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1325_c7_7234] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_7234] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;

     -- t16_MUX[uxn_opcodes_h_l1321_c7_b6a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond;
     t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue;
     t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output := t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_7234] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1325_c7_7234] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1335_c21_5852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_f914_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1321_c7_b6a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1321_c7_b6a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1321_c7_b6a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;

     -- MUX[uxn_opcodes_h_l1335_c21_5852] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1335_c21_5852_cond <= VAR_MUX_uxn_opcodes_h_l1335_c21_5852_cond;
     MUX_uxn_opcodes_h_l1335_c21_5852_iftrue <= VAR_MUX_uxn_opcodes_h_l1335_c21_5852_iftrue;
     MUX_uxn_opcodes_h_l1335_c21_5852_iffalse <= VAR_MUX_uxn_opcodes_h_l1335_c21_5852_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1335_c21_5852_return_output := MUX_uxn_opcodes_h_l1335_c21_5852_return_output;

     -- t16_MUX[uxn_opcodes_h_l1316_c7_d221] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1316_c7_d221_cond <= VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_cond;
     t16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue;
     t16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output := t16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;

     -- n16_MUX[uxn_opcodes_h_l1325_c7_7234] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1325_c7_7234_cond <= VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_cond;
     n16_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue;
     n16_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_return_output := n16_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1321_c7_b6a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue := VAR_MUX_uxn_opcodes_h_l1335_c21_5852_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;
     -- n16_MUX[uxn_opcodes_h_l1321_c7_b6a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond;
     n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue;
     n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output := n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1316_c7_d221] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;

     -- t16_MUX[uxn_opcodes_h_l1313_c7_6858] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1313_c7_6858_cond <= VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_cond;
     t16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue;
     t16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output := t16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1316_c7_d221] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1316_c7_d221] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1316_c7_d221] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1330_c7_49d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_49d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;
     -- t16_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := t16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1313_c7_6858] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_6858] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_6858] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1325_c7_7234] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_return_output := result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_6858] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;

     -- n16_MUX[uxn_opcodes_h_l1316_c7_d221] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1316_c7_d221_cond <= VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_cond;
     n16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue;
     n16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output := n16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7234_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1321_c7_b6a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- n16_MUX[uxn_opcodes_h_l1313_c7_6858] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1313_c7_6858_cond <= VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_cond;
     n16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue;
     n16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output := n16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_b6a7_return_output;
     -- n16_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := n16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1316_c7_d221] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_return_output := result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_d221_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1313_c7_6858] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_return_output := result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_6858_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1300_c2_ba69] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output := result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1339_l1296_DUPLICATE_2994 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1339_l1296_DUPLICATE_2994_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_ba69_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1339_l1296_DUPLICATE_2994_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1339_l1296_DUPLICATE_2994_return_output;
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
