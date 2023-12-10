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
-- Submodules: 71
entity mul2_0CLK_4712a73c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_4712a73c;
architecture arch of mul2_0CLK_4712a73c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1974_c6_c555]
signal BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1974_c2_0edc]
signal n16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1974_c2_0edc]
signal t16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1974_c2_0edc]
signal tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1974_c2_0edc]
signal result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1974_c2_0edc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1974_c2_0edc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1974_c2_0edc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1974_c2_0edc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1981_c11_71b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1981_c7_8bb4]
signal n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1981_c7_8bb4]
signal t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1981_c7_8bb4]
signal tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1981_c7_8bb4]
signal result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1981_c7_8bb4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1981_c7_8bb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1981_c7_8bb4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1981_c7_8bb4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1984_c11_2e50]
signal BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1984_c7_beff]
signal n16_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1984_c7_beff]
signal t16_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1984_c7_beff]
signal tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1984_c7_beff]
signal result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1984_c7_beff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1984_c7_beff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1984_c7_beff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1984_c7_beff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1989_c11_2055]
signal BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1989_c7_4348]
signal n16_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1989_c7_4348]
signal t16_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1989_c7_4348]
signal tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1989_c7_4348]
signal result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1989_c7_4348]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1989_c7_4348]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1989_c7_4348]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1989_c7_4348]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1990_c3_5183]
signal BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_1509]
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1993_c7_703d]
signal n16_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1993_c7_703d]
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_703d]
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_703d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_703d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_703d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_703d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1997_c11_95ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1997_c7_c396]
signal n16_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1997_c7_c396]
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1997_c7_c396]
signal result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c7_c396]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c7_c396]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c7_c396]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1997_c7_c396]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1998_c3_8aec]
signal BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1999_c11_89cc]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2001_c30_d443]
signal sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_f959]
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_7404]
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_7404]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_7404]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_7404]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_7404]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2009_c31_6090]
signal CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2011_c11_e2f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2011_c7_6476]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2011_c7_6476]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555
BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_left,
BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_right,
BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output);

-- n16_MUX_uxn_opcodes_h_l1974_c2_0edc
n16_MUX_uxn_opcodes_h_l1974_c2_0edc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond,
n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue,
n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse,
n16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output);

-- t16_MUX_uxn_opcodes_h_l1974_c2_0edc
t16_MUX_uxn_opcodes_h_l1974_c2_0edc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond,
t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue,
t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse,
t16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc
tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond,
tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc
result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc
result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc
result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output);

-- n16_MUX_uxn_opcodes_h_l1981_c7_8bb4
n16_MUX_uxn_opcodes_h_l1981_c7_8bb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond,
n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue,
n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse,
n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output);

-- t16_MUX_uxn_opcodes_h_l1981_c7_8bb4
t16_MUX_uxn_opcodes_h_l1981_c7_8bb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond,
t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue,
t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse,
t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4
tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond,
tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4
result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50
BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_left,
BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_right,
BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output);

-- n16_MUX_uxn_opcodes_h_l1984_c7_beff
n16_MUX_uxn_opcodes_h_l1984_c7_beff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1984_c7_beff_cond,
n16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue,
n16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse,
n16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output);

-- t16_MUX_uxn_opcodes_h_l1984_c7_beff
t16_MUX_uxn_opcodes_h_l1984_c7_beff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1984_c7_beff_cond,
t16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue,
t16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse,
t16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1984_c7_beff
tmp16_MUX_uxn_opcodes_h_l1984_c7_beff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_cond,
tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue,
tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse,
tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff
result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff
result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff
result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055
BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_left,
BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_right,
BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output);

-- n16_MUX_uxn_opcodes_h_l1989_c7_4348
n16_MUX_uxn_opcodes_h_l1989_c7_4348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1989_c7_4348_cond,
n16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue,
n16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse,
n16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output);

-- t16_MUX_uxn_opcodes_h_l1989_c7_4348
t16_MUX_uxn_opcodes_h_l1989_c7_4348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1989_c7_4348_cond,
t16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue,
t16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse,
t16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1989_c7_4348
tmp16_MUX_uxn_opcodes_h_l1989_c7_4348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_cond,
tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue,
tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse,
tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348
result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_cond,
result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183
BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_left,
BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_right,
BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_left,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_right,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output);

-- n16_MUX_uxn_opcodes_h_l1993_c7_703d
n16_MUX_uxn_opcodes_h_l1993_c7_703d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1993_c7_703d_cond,
n16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue,
n16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse,
n16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1993_c7_703d
tmp16_MUX_uxn_opcodes_h_l1993_c7_703d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_cond,
tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output);

-- n16_MUX_uxn_opcodes_h_l1997_c7_c396
n16_MUX_uxn_opcodes_h_l1997_c7_c396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1997_c7_c396_cond,
n16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue,
n16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse,
n16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1997_c7_c396
tmp16_MUX_uxn_opcodes_h_l1997_c7_c396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_cond,
tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue,
tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse,
tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396
result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_cond,
result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec
BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_left,
BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_right,
BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2001_c30_d443
sp_relative_shift_uxn_opcodes_h_l2001_c30_d443 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_ins,
sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_x,
sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_y,
sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_left,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_right,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_cond,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2009_c31_6090
CONST_SR_8_uxn_opcodes_h_l2009_c31_6090 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_x,
CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476
result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476
result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0
CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output,
 n16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
 t16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output,
 n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output,
 t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output,
 n16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output,
 t16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output,
 tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output,
 n16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output,
 t16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output,
 tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output,
 n16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output,
 n16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output,
 tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_return_output,
 sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_return_output,
 CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_c658 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1982_c3_edda : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_becb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_de71 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1999_c3_fd5e : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2003_c3_938f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2004_c21_c9ae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2008_c3_7b51 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2007_c3_c9e7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2009_c21_f1c1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_88b7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_3767_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1985_l1990_l1998_l1994_DUPLICATE_e2b1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l1993_DUPLICATE_f742_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1970_l2016_DUPLICATE_a5d5_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_becb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_becb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_de71 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_de71;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1982_c3_edda := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1982_c3_edda;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_c658 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_c658;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2007_c3_c9e7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2007_c3_c9e7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2003_c3_938f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2003_c3_938f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2008_c3_7b51 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2008_c3_7b51;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1989_c11_2055] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_left;
     BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output := BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1974_c6_c555] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_left;
     BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output := BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1985_l1990_l1998_l1994_DUPLICATE_e2b1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1985_l1990_l1998_l1994_DUPLICATE_e2b1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1981_c11_71b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1997_c11_95ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_88b7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_88b7_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_1509] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_left;
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output := BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l1993_DUPLICATE_f742 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l1993_DUPLICATE_f742_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2009_c31_6090] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_return_output := CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2011_c11_e2f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_f959] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_left;
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output := BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_3767 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_3767_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1984_c11_2e50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_left;
     BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output := BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2001_c30_d443] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_ins;
     sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_x;
     sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_return_output := sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1974_c6_c555_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_71b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1984_c11_2e50_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c11_2055_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_1509_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_95ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_f959_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2011_c11_e2f4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1985_l1990_l1998_l1994_DUPLICATE_e2b1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1985_l1990_l1998_l1994_DUPLICATE_e2b1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1985_l1990_l1998_l1994_DUPLICATE_e2b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_3767_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_3767_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_3767_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_3767_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_3767_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_3767_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2011_l2006_l1997_l1993_l1989_l1984_l1981_DUPLICATE_9762_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2011_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_09fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l1993_DUPLICATE_f742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l1993_DUPLICATE_f742_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_88b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_88b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_88b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_88b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_88b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1974_l2006_l1993_l1989_l1984_l1981_DUPLICATE_88b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2001_c30_d443_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1990_c3_5183] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_left;
     BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_return_output := BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2011_c7_6476] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1998_c3_8aec] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_left;
     BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_return_output := BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_7404] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2009_c21_f1c1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2009_c21_f1c1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2009_c31_6090_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2011_c7_6476] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_7404] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1990_c3_5183_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1998_c3_8aec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2009_c21_f1c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1986_l1995_DUPLICATE_2dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2011_c7_6476_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2011_c7_6476_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;
     -- t16_MUX[uxn_opcodes_h_l1989_c7_4348] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1989_c7_4348_cond <= VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_cond;
     t16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue;
     t16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output := t16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_7404] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1999_c11_89cc] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_7404] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_return_output := result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;

     -- n16_MUX[uxn_opcodes_h_l1997_c7_c396] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1997_c7_c396_cond <= VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_cond;
     n16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue;
     n16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output := n16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_7404] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1997_c7_c396] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c7_c396] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1999_c3_fd5e := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1999_c11_89cc_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_7404_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue := VAR_tmp16_uxn_opcodes_h_l1999_c3_fd5e;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_703d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_703d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1997_c7_c396] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_cond;
     tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output := tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;

     -- t16_MUX[uxn_opcodes_h_l1984_c7_beff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1984_c7_beff_cond <= VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_cond;
     t16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue;
     t16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output := t16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c7_c396] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c7_c396] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2004_c21_c9ae] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2004_c21_c9ae_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1999_c3_fd5e);

     -- n16_MUX[uxn_opcodes_h_l1993_c7_703d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1993_c7_703d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_cond;
     n16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue;
     n16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output := n16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2004_c21_c9ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;
     -- t16_MUX[uxn_opcodes_h_l1981_c7_8bb4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond;
     t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue;
     t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output := t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_703d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1993_c7_703d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_cond;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output := tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_703d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1989_c7_4348] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1989_c7_4348_cond <= VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_cond;
     n16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue;
     n16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output := n16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1989_c7_4348] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1989_c7_4348] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1997_c7_c396] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_return_output := result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c7_c396_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;
     -- n16_MUX[uxn_opcodes_h_l1984_c7_beff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1984_c7_beff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_cond;
     n16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue;
     n16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output := n16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1984_c7_beff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1989_c7_4348] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1989_c7_4348] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_cond;
     tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output := tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;

     -- t16_MUX[uxn_opcodes_h_l1974_c2_0edc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond;
     t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue;
     t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output := t16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1989_c7_4348] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_703d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1984_c7_beff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_703d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1981_c7_8bb4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1984_c7_beff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_cond;
     tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output := tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1984_c7_beff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;

     -- n16_MUX[uxn_opcodes_h_l1981_c7_8bb4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond;
     n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue;
     n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output := n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1989_c7_4348] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_return_output := result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1984_c7_beff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1981_c7_8bb4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1989_c7_4348_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;
     -- n16_MUX[uxn_opcodes_h_l1974_c2_0edc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond;
     n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue;
     n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output := n16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1984_c7_beff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1974_c2_0edc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1981_c7_8bb4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond;
     tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output := tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1981_c7_8bb4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1974_c2_0edc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1981_c7_8bb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1984_c7_beff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1981_c7_8bb4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1974_c2_0edc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_cond;
     tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output := tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1974_c2_0edc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1974_c2_0edc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1981_c7_8bb4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1974_c2_0edc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1970_l2016_DUPLICATE_a5d5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1970_l2016_DUPLICATE_a5d5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1974_c2_0edc_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1970_l2016_DUPLICATE_a5d5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1970_l2016_DUPLICATE_a5d5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
