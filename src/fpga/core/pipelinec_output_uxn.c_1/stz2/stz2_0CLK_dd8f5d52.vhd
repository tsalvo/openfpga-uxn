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
entity stz2_0CLK_dd8f5d52 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_dd8f5d52;
architecture arch of stz2_0CLK_dd8f5d52 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1376_c6_cf27]
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal t8_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1376_c2_0c46]
signal n16_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1383_c11_f407]
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1383_c7_5294]
signal result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c7_5294]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1383_c7_5294]
signal result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1383_c7_5294]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c7_5294]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c7_5294]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1383_c7_5294]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1383_c7_5294]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1383_c7_5294]
signal t8_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1383_c7_5294]
signal n16_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1387_c11_3d11]
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1387_c7_5397]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1387_c7_5397]
signal result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1387_c7_5397]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1387_c7_5397]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1387_c7_5397]
signal result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1387_c7_5397]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1387_c7_5397]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1387_c7_5397]
signal t8_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1387_c7_5397]
signal n16_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1391_c11_8981]
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1391_c7_a795]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1391_c7_a795]
signal result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1391_c7_a795]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1391_c7_a795]
signal result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1391_c7_a795]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1391_c7_a795]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1391_c7_a795]
signal n16_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1394_c30_5bad]
signal sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1397_c31_331e]
signal CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_c249]
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_613a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1399_c7_613a]
signal result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_613a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1399_c7_613a]
signal result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1399_c7_613a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1401_c33_1183]
signal BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1404_c11_2e3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1404_c7_c4bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1404_c7_c4bc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output : unsigned(0 downto 0);

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

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_stack_operation_16bit := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_left,
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_right,
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46
result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46
result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46
result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- t8_MUX_uxn_opcodes_h_l1376_c2_0c46
t8_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
t8_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- n16_MUX_uxn_opcodes_h_l1376_c2_0c46
n16_MUX_uxn_opcodes_h_l1376_c2_0c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1376_c2_0c46_cond,
n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue,
n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse,
n16_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_left,
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_right,
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294
result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294
result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- t8_MUX_uxn_opcodes_h_l1383_c7_5294
t8_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
t8_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
t8_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
t8_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- n16_MUX_uxn_opcodes_h_l1383_c7_5294
n16_MUX_uxn_opcodes_h_l1383_c7_5294 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1383_c7_5294_cond,
n16_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue,
n16_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse,
n16_MUX_uxn_opcodes_h_l1383_c7_5294_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_left,
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_right,
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397
result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond,
result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397
result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond,
result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397
result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_return_output);

-- t8_MUX_uxn_opcodes_h_l1387_c7_5397
t8_MUX_uxn_opcodes_h_l1387_c7_5397 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1387_c7_5397_cond,
t8_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue,
t8_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse,
t8_MUX_uxn_opcodes_h_l1387_c7_5397_return_output);

-- n16_MUX_uxn_opcodes_h_l1387_c7_5397
n16_MUX_uxn_opcodes_h_l1387_c7_5397 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1387_c7_5397_cond,
n16_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue,
n16_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse,
n16_MUX_uxn_opcodes_h_l1387_c7_5397_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_left,
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_right,
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795
result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond,
result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond,
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795
result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_return_output);

-- n16_MUX_uxn_opcodes_h_l1391_c7_a795
n16_MUX_uxn_opcodes_h_l1391_c7_a795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1391_c7_a795_cond,
n16_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue,
n16_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse,
n16_MUX_uxn_opcodes_h_l1391_c7_a795_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad
sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_ins,
sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_x,
sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_y,
sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1397_c31_331e
CONST_SR_8_uxn_opcodes_h_l1397_c31_331e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_x,
CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_left,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_right,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a
result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a
result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a
result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183
BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_left,
BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_right,
BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a
BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc
result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 t8_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 n16_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 t8_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 n16_MUX_uxn_opcodes_h_l1383_c7_5294_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_return_output,
 t8_MUX_uxn_opcodes_h_l1387_c7_5397_return_output,
 n16_MUX_uxn_opcodes_h_l1387_c7_5397_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_return_output,
 n16_MUX_uxn_opcodes_h_l1391_c7_a795_return_output,
 sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_return_output,
 CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_1e49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1384_c3_9158 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1383_c7_5294_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1388_c8_5d28_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1396_c22_02ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1397_c21_d7e7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1401_c22_06ee_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1402_c21_b9b2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_f876_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_7e7c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1387_l1376_l1391_l1383_DUPLICATE_eb8e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_c657_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1387_l1376_DUPLICATE_e582_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1404_l1387_l1376_l1383_l1399_DUPLICATE_b352_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1404_l1391_l1387_l1383_l1399_DUPLICATE_2353_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1370_l1409_DUPLICATE_10f8_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1384_c3_9158 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1384_c3_9158;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_1e49 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_1e49;
     VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_ins := VAR_ins;
     VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_x := VAR_previous_stack_read;
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1383_c11_f407] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_left;
     BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output := BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1401_c33_1183] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1402_c21_b9b2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1402_c21_b9b2_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1387_l1376_l1391_l1383_DUPLICATE_eb8e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1387_l1376_l1391_l1383_DUPLICATE_eb8e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1387_c11_3d11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_left;
     BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output := BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1387_l1376_DUPLICATE_e582 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1387_l1376_DUPLICATE_e582_return_output := result.is_stack_operation_16bit;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1396_c22_02ed] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1396_c22_02ed_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_f876 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_f876_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1404_l1391_l1387_l1383_l1399_DUPLICATE_2353 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1404_l1391_l1387_l1383_l1399_DUPLICATE_2353_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1376_c6_cf27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_left;
     BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output := BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1394_c30_5bad] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_ins;
     sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_x;
     sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_return_output := sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_c249] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_left;
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output := BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1404_l1387_l1376_l1383_l1399_DUPLICATE_b352 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1404_l1387_l1376_l1383_l1399_DUPLICATE_b352_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1383_c7_5294_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1404_c11_2e3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1391_c11_8981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_left;
     BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output := BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_c657 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_c657_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1388_c8_5d28] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1388_c8_5d28_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l1397_c31_331e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_return_output := CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_7e7c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_7e7c_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_cf27_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f407_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_3d11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_8981_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_c249_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1404_c11_2e3a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1396_c22_02ed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1388_c8_5d28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1402_c21_b9b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1387_l1376_l1391_l1383_DUPLICATE_eb8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1387_l1376_l1391_l1383_DUPLICATE_eb8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1387_l1376_l1391_l1383_DUPLICATE_eb8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1387_l1376_l1391_l1383_DUPLICATE_eb8e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_f876_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_f876_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_f876_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_f876_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1404_l1391_l1387_l1383_l1399_DUPLICATE_2353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1404_l1391_l1387_l1383_l1399_DUPLICATE_2353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1404_l1391_l1387_l1383_l1399_DUPLICATE_2353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1404_l1391_l1387_l1383_l1399_DUPLICATE_2353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1404_l1391_l1387_l1383_l1399_DUPLICATE_2353_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1404_l1387_l1376_l1383_l1399_DUPLICATE_b352_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1404_l1387_l1376_l1383_l1399_DUPLICATE_b352_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1404_l1387_l1376_l1383_l1399_DUPLICATE_b352_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1404_l1387_l1376_l1383_l1399_DUPLICATE_b352_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1404_l1387_l1376_l1383_l1399_DUPLICATE_b352_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_c657_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_c657_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_c657_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_c657_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1387_l1376_DUPLICATE_e582_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1387_l1376_DUPLICATE_e582_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_7e7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_7e7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_7e7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1387_l1376_l1383_l1399_DUPLICATE_7e7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1383_c7_5294_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1394_c30_5bad_return_output;
     -- n16_MUX[uxn_opcodes_h_l1391_c7_a795] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1391_c7_a795_cond <= VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_cond;
     n16_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue;
     n16_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_return_output := n16_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1399_c7_613a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1397_c21_d7e7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1397_c21_d7e7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1397_c31_331e_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1391_c7_a795] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1404_c7_c4bc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1404_c7_c4bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output;

     -- t8_MUX[uxn_opcodes_h_l1387_c7_5397] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1387_c7_5397_cond <= VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_cond;
     t8_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue;
     t8_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_return_output := t8_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1401_c22_06ee] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1401_c22_06ee_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1401_c33_1183_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_613a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1387_c7_5397] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1401_c22_06ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1397_c21_d7e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1404_c7_c4bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;
     -- t8_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     t8_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     t8_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := t8_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1387_c7_5397] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1399_c7_613a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_613a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1399_c7_613a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1387_c7_5397] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1387_c7_5397_cond <= VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_cond;
     n16_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue;
     n16_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_return_output := n16_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1391_c7_a795] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output := result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1391_c7_a795] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1399_c7_613a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1391_c7_a795] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output := result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;

     -- n16_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     n16_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     n16_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := n16_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1391_c7_a795] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1387_c7_5397] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output := result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1391_c7_a795] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;

     -- t8_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := t8_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1387_c7_5397] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1391_c7_a795_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;
     -- n16_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := n16_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1387_c7_5397] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1387_c7_5397] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output := result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1387_c7_5397] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;

     -- Submodule level 5
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1387_c7_5397_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c7_5294] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1383_c7_5294_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c2_0c46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1370_l1409_DUPLICATE_10f8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1370_l1409_DUPLICATE_10f8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1376_c2_0c46_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1370_l1409_DUPLICATE_10f8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1370_l1409_DUPLICATE_10f8_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
