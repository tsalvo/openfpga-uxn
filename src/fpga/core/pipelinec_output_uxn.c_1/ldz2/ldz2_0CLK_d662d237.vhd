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
entity ldz2_0CLK_d662d237 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_d662d237;
architecture arch of ldz2_0CLK_d662d237 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_b7b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_96d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1405_c2_b690]
signal t8_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1405_c2_b690]
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_b690]
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_b690]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_b690]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_b690]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_b690]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_b690]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1405_c2_b690]
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1406_c3_af3f[uxn_opcodes_h_l1406_c3_af3f]
signal printf_uxn_opcodes_h_l1406_c3_af3f_uxn_opcodes_h_l1406_c3_af3f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_acfe]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1410_c7_88a3]
signal t8_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_88a3]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_88a3]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_88a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_88a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_88a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_88a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_88a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1410_c7_88a3]
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_562d]
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1413_c7_07cf]
signal t8_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1413_c7_07cf]
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_07cf]
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_07cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_07cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_07cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_07cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_07cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1413_c7_07cf]
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_38ce]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_1e4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1419_c7_eebe]
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_eebe]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_eebe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_eebe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_eebe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_eebe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1419_c7_eebe]
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1421_c33_ecc5]
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_d286]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_24e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_24e2]
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_24e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_24e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1423_c7_24e2]
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1425_c3_daa7]
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_82eb]
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_3499]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_3499]
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_3499]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_3499]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1427_c7_3499]
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1428_c3_92d2]
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_9dde]
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_cc53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_cc53]
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_cc53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_cc53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1435_c31_2267]
signal CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_641e]
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_d994]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_d994]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a310( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_return_output);

-- t8_MUX_uxn_opcodes_h_l1405_c2_b690
t8_MUX_uxn_opcodes_h_l1405_c2_b690 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1405_c2_b690_cond,
t8_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue,
t8_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse,
t8_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1405_c2_b690
tmp16_MUX_uxn_opcodes_h_l1405_c2_b690 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_cond,
tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue,
tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse,
tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

-- printf_uxn_opcodes_h_l1406_c3_af3f_uxn_opcodes_h_l1406_c3_af3f
printf_uxn_opcodes_h_l1406_c3_af3f_uxn_opcodes_h_l1406_c3_af3f : entity work.printf_uxn_opcodes_h_l1406_c3_af3f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1406_c3_af3f_uxn_opcodes_h_l1406_c3_af3f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output);

-- t8_MUX_uxn_opcodes_h_l1410_c7_88a3
t8_MUX_uxn_opcodes_h_l1410_c7_88a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1410_c7_88a3_cond,
t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue,
t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse,
t8_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3
tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_cond,
tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_left,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_right,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output);

-- t8_MUX_uxn_opcodes_h_l1413_c7_07cf
t8_MUX_uxn_opcodes_h_l1413_c7_07cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1413_c7_07cf_cond,
t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue,
t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse,
t8_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf
tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_cond,
tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce
sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe
tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_cond,
tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue,
tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse,
tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_left,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_right,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2
tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_cond,
tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7
CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_x,
CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_left,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_right,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_cond,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1427_c7_3499
tmp16_MUX_uxn_opcodes_h_l1427_c7_3499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_cond,
tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue,
tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse,
tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2
BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_left,
BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_right,
BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_left,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_right,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_cond,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1435_c31_2267
CONST_SR_8_uxn_opcodes_h_l1435_c31_2267 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_x,
CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_left,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_right,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_return_output,
 t8_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
 tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output,
 t8_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output,
 t8_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output,
 tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output,
 CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_return_output,
 tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output,
 CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_0131 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1406_c3_af3f_uxn_opcodes_h_l1406_c3_af3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_0949 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_573c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_5ae7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_739b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_bc97_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_ebb0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_dbc5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_20b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1405_l1433_l1423_l1419_l1413_DUPLICATE_7ff0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_954b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_34d6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1423_l1413_l1419_l1433_DUPLICATE_c3ac_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_90c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1442_l1400_DUPLICATE_7015_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_ebb0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_ebb0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_739b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_739b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_0131 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_0131;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_0949 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_0949;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_9dde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_left;
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output := BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1421_c33_ecc5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_641e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_38ce] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_b7b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_d286] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1405_l1433_l1423_l1419_l1413_DUPLICATE_7ff0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1405_l1433_l1423_l1419_l1413_DUPLICATE_7ff0_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1423_l1413_l1419_l1433_DUPLICATE_c3ac LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1423_l1413_l1419_l1433_DUPLICATE_c3ac_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_82eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_1e4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1435_c31_2267] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_return_output := CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_562d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_20b6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_20b6_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_34d6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_34d6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1417_c22_573c] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_573c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_acfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_954b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_954b_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_90c8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_90c8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b7b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_acfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_562d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1e4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_d286_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_82eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_9dde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_641e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_573c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_90c8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_90c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_34d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_34d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_34d6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_20b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_20b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_20b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1437_l1433_l1427_l1423_l1419_l1413_DUPLICATE_5211_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_954b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_954b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1419_DUPLICATE_954b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1437_l1405_l1433_l1423_l1419_l1413_DUPLICATE_18da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1423_l1413_l1419_l1433_DUPLICATE_c3ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1423_l1413_l1419_l1433_DUPLICATE_c3ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1423_l1413_l1419_l1433_DUPLICATE_c3ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1423_l1413_l1419_l1433_DUPLICATE_c3ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1405_l1433_l1423_l1419_l1413_DUPLICATE_7ff0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1405_l1433_l1423_l1419_l1413_DUPLICATE_7ff0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1405_l1433_l1423_l1419_l1413_DUPLICATE_7ff0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1405_l1433_l1423_l1419_l1413_DUPLICATE_7ff0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1405_l1433_l1423_l1419_l1413_DUPLICATE_7ff0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1405_l1433_l1423_l1419_l1413_DUPLICATE_7ff0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_38ce_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_07cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;

     -- t8_MUX[uxn_opcodes_h_l1413_c7_07cf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1413_c7_07cf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_cond;
     t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue;
     t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output := t8_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1435_c21_dbc5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_dbc5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_2267_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_cc53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1421_c22_5ae7] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_5ae7_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_ecc5_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_96d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_d994] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_d994] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_eebe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1425_c3_daa7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_return_output := CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1428_c3_92d2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_left;
     BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_return_output := BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_5ae7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_dbc5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_daa7_return_output;
     VAR_printf_uxn_opcodes_h_l1406_c3_af3f_uxn_opcodes_h_l1406_c3_af3f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_96d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_d994_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_d994_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_cc53] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output := result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_cc53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_07cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1431_c21_bc97] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_bc97_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_92d2_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1427_c7_3499] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_cond;
     tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_return_output := tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_3499] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_cc53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output;

     -- t8_MUX[uxn_opcodes_h_l1410_c7_88a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1410_c7_88a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_cond;
     t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue;
     t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output := t8_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;

     -- printf_uxn_opcodes_h_l1406_c3_af3f[uxn_opcodes_h_l1406_c3_af3f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1406_c3_af3f_uxn_opcodes_h_l1406_c3_af3f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1406_c3_af3f_uxn_opcodes_h_l1406_c3_af3f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_88a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1419_c7_eebe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output := result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_bc97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_cc53_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;
     -- t8_MUX[uxn_opcodes_h_l1405_c2_b690] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1405_c2_b690_cond <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_cond;
     t8_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue;
     t8_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_return_output := t8_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_3499] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1423_c7_24e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_cond;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output := tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1413_c7_07cf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_b690] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_3499] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_3499] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_return_output := result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_88a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_24e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3499_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_88a3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_b690] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1419_c7_eebe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_cond;
     tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output := tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_eebe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_24e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_24e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_24e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_24e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_eebe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_eebe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1413_c7_07cf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_cond;
     tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output := tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_eebe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1405_c2_b690] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output := result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_07cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_eebe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_07cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1410_c7_88a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_cond;
     tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output := tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_88a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_07cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_07cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_07cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_88a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_88a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_88a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1405_c2_b690] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_cond;
     tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_return_output := tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_b690] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_88a3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_b690] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output := result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_b690] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_b690] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1442_l1400_DUPLICATE_7015 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1442_l1400_DUPLICATE_7015_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a310(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_b690_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_b690_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1442_l1400_DUPLICATE_7015_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1442_l1400_DUPLICATE_7015_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
