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
-- BIN_OP_EQ[uxn_opcodes_h_l1295_c6_fa0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1295_c2_483e]
signal n16_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1295_c2_483e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1295_c2_483e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1295_c2_483e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1295_c2_483e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1295_c2_483e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1295_c2_483e]
signal result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1295_c2_483e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1295_c2_483e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1295_c2_483e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1295_c2_483e]
signal t16_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_08e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1308_c7_de2b]
signal n16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_de2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_de2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_de2b]
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_de2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_de2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1308_c7_de2b]
signal t16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1311_c11_11c6]
signal BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1311_c7_7b94]
signal n16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1311_c7_7b94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1311_c7_7b94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1311_c7_7b94]
signal result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1311_c7_7b94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1311_c7_7b94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1311_c7_7b94]
signal t16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1316_c11_c75f]
signal BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1316_c7_4125]
signal n16_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1316_c7_4125]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1316_c7_4125]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1316_c7_4125]
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1316_c7_4125]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1316_c7_4125]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1316_c7_4125]
signal t16_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1317_c3_56ab]
signal BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1320_c11_6e8e]
signal BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1320_c7_1d0b]
signal n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1320_c7_1d0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1320_c7_1d0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1320_c7_1d0b]
signal result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1320_c7_1d0b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1320_c7_1d0b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1323_c30_b993]
signal sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_81d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1325_c7_7a6c]
signal n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_7a6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1325_c7_7a6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1325_c7_7a6c]
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_7a6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1325_c7_7a6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1326_c3_e344]
signal BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1330_c21_a651]
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1330_c21_6b09]
signal MUX_uxn_opcodes_h_l1330_c21_6b09_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1330_c21_6b09_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1330_c21_6b09_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1330_c21_6b09_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e
BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output);

-- n16_MUX_uxn_opcodes_h_l1295_c2_483e
n16_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
n16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
n16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
n16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e
result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e
result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e
result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e
result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- t16_MUX_uxn_opcodes_h_l1295_c2_483e
t16_MUX_uxn_opcodes_h_l1295_c2_483e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1295_c2_483e_cond,
t16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue,
t16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse,
t16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output);

-- n16_MUX_uxn_opcodes_h_l1308_c7_de2b
n16_MUX_uxn_opcodes_h_l1308_c7_de2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond,
n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue,
n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse,
n16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output);

-- t16_MUX_uxn_opcodes_h_l1308_c7_de2b
t16_MUX_uxn_opcodes_h_l1308_c7_de2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond,
t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue,
t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse,
t16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_left,
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_right,
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output);

-- n16_MUX_uxn_opcodes_h_l1311_c7_7b94
n16_MUX_uxn_opcodes_h_l1311_c7_7b94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond,
n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue,
n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse,
n16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94
result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_cond,
result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output);

-- t16_MUX_uxn_opcodes_h_l1311_c7_7b94
t16_MUX_uxn_opcodes_h_l1311_c7_7b94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond,
t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue,
t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse,
t16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_left,
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_right,
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output);

-- n16_MUX_uxn_opcodes_h_l1316_c7_4125
n16_MUX_uxn_opcodes_h_l1316_c7_4125 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1316_c7_4125_cond,
n16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue,
n16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse,
n16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_cond,
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_return_output);

-- t16_MUX_uxn_opcodes_h_l1316_c7_4125
t16_MUX_uxn_opcodes_h_l1316_c7_4125 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1316_c7_4125_cond,
t16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue,
t16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse,
t16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab
BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_left,
BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_right,
BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e
BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_left,
BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_right,
BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output);

-- n16_MUX_uxn_opcodes_h_l1320_c7_1d0b
n16_MUX_uxn_opcodes_h_l1320_c7_1d0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond,
n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue,
n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse,
n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b
result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1323_c30_b993
sp_relative_shift_uxn_opcodes_h_l1323_c30_b993 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_ins,
sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_x,
sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_y,
sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output);

-- n16_MUX_uxn_opcodes_h_l1325_c7_7a6c
n16_MUX_uxn_opcodes_h_l1325_c7_7a6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond,
n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue,
n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse,
n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344
BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_left,
BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_right,
BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651
BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_left,
BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_right,
BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_return_output);

-- MUX_uxn_opcodes_h_l1330_c21_6b09
MUX_uxn_opcodes_h_l1330_c21_6b09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1330_c21_6b09_cond,
MUX_uxn_opcodes_h_l1330_c21_6b09_iftrue,
MUX_uxn_opcodes_h_l1330_c21_6b09_iffalse,
MUX_uxn_opcodes_h_l1330_c21_6b09_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output,
 n16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 t16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output,
 n16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output,
 t16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output,
 n16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output,
 t16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output,
 n16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_return_output,
 t16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output,
 n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output,
 n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_return_output,
 MUX_uxn_opcodes_h_l1330_c21_6b09_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_810a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1300_c3_f830 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_062a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_5f12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1318_c3_2c7c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1329_c3_f20b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1327_c3_986a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1295_l1325_l1320_DUPLICATE_64b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_7671_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_cea9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1308_l1311_l1325_DUPLICATE_9948_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1326_l1317_l1312_l1321_DUPLICATE_fe60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1320_l1325_DUPLICATE_f3bb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1334_l1291_DUPLICATE_163c_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_062a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_062a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1327_c3_986a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1327_c3_986a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1318_c3_2c7c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1318_c3_2c7c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1300_c3_f830 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1300_c3_f830;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_810a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_810a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_5f12 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_5f12;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1329_c3_f20b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1329_c3_f20b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_81d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1320_l1325_DUPLICATE_f3bb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1320_l1325_DUPLICATE_f3bb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1295_c6_fa0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1316_c11_c75f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1320_c11_6e8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1295_c2_483e_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1311_c11_11c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1295_c2_483e_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1308_l1311_l1325_DUPLICATE_9948 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1308_l1311_l1325_DUPLICATE_9948_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_cea9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_cea9_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1326_l1317_l1312_l1321_DUPLICATE_fe60 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1326_l1317_l1312_l1321_DUPLICATE_fe60_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1323_c30_b993] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_ins;
     sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_x;
     sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_return_output := sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1295_c2_483e_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_08e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1295_l1325_l1320_DUPLICATE_64b1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1295_l1325_l1320_DUPLICATE_64b1_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_7671 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_7671_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1295_c2_483e_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c6_fa0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_08e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_11c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_c75f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_6e8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_81d0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1326_l1317_l1312_l1321_DUPLICATE_fe60_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1326_l1317_l1312_l1321_DUPLICATE_fe60_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1326_l1317_l1312_l1321_DUPLICATE_fe60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1308_l1311_l1325_DUPLICATE_9948_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1308_l1311_l1325_DUPLICATE_9948_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1308_l1311_l1325_DUPLICATE_9948_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1308_l1311_l1325_DUPLICATE_9948_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_7671_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_7671_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_7671_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_7671_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_7671_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_cea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_cea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_cea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_cea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1325_l1320_DUPLICATE_cea9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1320_l1325_DUPLICATE_f3bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1320_l1325_DUPLICATE_f3bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1295_l1325_l1320_DUPLICATE_64b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1295_l1325_l1320_DUPLICATE_64b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1295_l1325_l1320_DUPLICATE_64b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1295_l1325_l1320_DUPLICATE_64b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1295_l1325_l1320_DUPLICATE_64b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1316_l1311_l1308_l1295_l1325_l1320_DUPLICATE_64b1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1295_c2_483e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1295_c2_483e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1295_c2_483e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1295_c2_483e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1323_c30_b993_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1325_c7_7a6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1317_c3_56ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_left;
     BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_return_output := BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1325_c7_7a6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_7a6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_7a6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1326_c3_e344] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_left;
     BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_return_output := BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1317_c3_56ab_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1326_c3_e344_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1313_l1322_DUPLICATE_484b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;
     -- n16_MUX[uxn_opcodes_h_l1325_c7_7a6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond;
     n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue;
     n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output := n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1320_c7_1d0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1320_c7_1d0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1330_c21_a651] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_left;
     BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_return_output := BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_return_output;

     -- t16_MUX[uxn_opcodes_h_l1316_c7_4125] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1316_c7_4125_cond <= VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_cond;
     t16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue;
     t16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output := t16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1320_c7_1d0b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1320_c7_1d0b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c21_a651_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;
     -- t16_MUX[uxn_opcodes_h_l1311_c7_7b94] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond <= VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond;
     t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue;
     t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output := t16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1316_c7_4125] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1316_c7_4125] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1316_c7_4125] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;

     -- n16_MUX[uxn_opcodes_h_l1320_c7_1d0b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond;
     n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue;
     n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output := n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;

     -- MUX[uxn_opcodes_h_l1330_c21_6b09] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1330_c21_6b09_cond <= VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_cond;
     MUX_uxn_opcodes_h_l1330_c21_6b09_iftrue <= VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_iftrue;
     MUX_uxn_opcodes_h_l1330_c21_6b09_iffalse <= VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_return_output := MUX_uxn_opcodes_h_l1330_c21_6b09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1316_c7_4125] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue := VAR_MUX_uxn_opcodes_h_l1330_c21_6b09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1311_c7_7b94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;

     -- t16_MUX[uxn_opcodes_h_l1308_c7_de2b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond;
     t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue;
     t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output := t16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1311_c7_7b94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1325_c7_7a6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1311_c7_7b94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;

     -- n16_MUX[uxn_opcodes_h_l1316_c7_4125] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1316_c7_4125_cond <= VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_cond;
     n16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue;
     n16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output := n16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1311_c7_7b94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_7a6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_de2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     t16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     t16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := t16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1320_c7_1d0b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_de2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1311_c7_7b94] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond <= VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_cond;
     n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue;
     n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output := n16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_de2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_de2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1320_c7_1d0b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1316_c7_4125] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_return_output := result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1308_c7_de2b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_cond;
     n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue;
     n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output := n16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_4125_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1311_c7_7b94] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output := result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;

     -- n16_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     n16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     n16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := n16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1311_c7_7b94_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_de2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_de2b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1295_c2_483e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1334_l1291_DUPLICATE_163c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1334_l1291_DUPLICATE_163c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1295_c2_483e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1295_c2_483e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1334_l1291_DUPLICATE_163c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1334_l1291_DUPLICATE_163c_return_output;
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
