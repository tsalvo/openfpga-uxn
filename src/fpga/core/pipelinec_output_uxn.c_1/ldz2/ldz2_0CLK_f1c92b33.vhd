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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 82
entity ldz2_0CLK_f1c92b33 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_f1c92b33;
architecture arch of ldz2_0CLK_f1c92b33 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1594_c6_eff2]
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1594_c2_6a43]
signal tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1594_c2_6a43]
signal t8_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1594_c2_6a43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1594_c2_6a43]
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1594_c2_6a43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1594_c2_6a43]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c2_6a43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1594_c2_6a43]
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c2_6a43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1599_c11_353e]
signal BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1599_c7_fe4c]
signal tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1599_c7_fe4c]
signal t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1599_c7_fe4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1599_c7_fe4c]
signal result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1599_c7_fe4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1599_c7_fe4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1599_c7_fe4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1599_c7_fe4c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1599_c7_fe4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_a775]
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1602_c7_8cd7]
signal tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1602_c7_8cd7]
signal t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1602_c7_8cd7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1602_c7_8cd7]
signal result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1602_c7_8cd7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1602_c7_8cd7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_8cd7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1602_c7_8cd7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_8cd7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1605_c32_3ba2]
signal BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1605_c32_8550]
signal BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1605_c32_7fff]
signal MUX_uxn_opcodes_h_l1605_c32_7fff_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1605_c32_7fff_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1605_c32_7fff_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1605_c32_7fff_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_43b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1608_c7_1820]
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1608_c7_1820]
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_1820]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c7_1820]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1608_c7_1820]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1608_c7_1820]
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_1820]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1612_c11_f37a]
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1612_c7_b6ec]
signal tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1612_c7_b6ec]
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1612_c7_b6ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1612_c7_b6ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1612_c7_b6ec]
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1612_c7_b6ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1614_c3_5df5]
signal CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1615_c32_f253]
signal BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1617_c11_9561]
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1617_c7_02c7]
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1617_c7_02c7]
signal result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1617_c7_02c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1617_c7_02c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1617_c7_02c7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1617_c7_02c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1618_c32_7acf]
signal BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1620_c11_0d71]
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1620_c7_6435]
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1620_c7_6435]
signal result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1620_c7_6435]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1620_c7_6435]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1620_c7_6435]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1621_c3_abf4]
signal BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_2e45]
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1626_c7_65f8]
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_65f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1626_c7_65f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_65f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1628_c34_c6c6]
signal CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_6690]
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_d6b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_d6b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a287( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2
BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_left,
BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_right,
BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43
tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_cond,
tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue,
tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse,
tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

-- t8_MUX_uxn_opcodes_h_l1594_c2_6a43
t8_MUX_uxn_opcodes_h_l1594_c2_6a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1594_c2_6a43_cond,
t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue,
t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse,
t8_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_cond,
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e
BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_left,
BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_right,
BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c
tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond,
tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output);

-- t8_MUX_uxn_opcodes_h_l1599_c7_fe4c
t8_MUX_uxn_opcodes_h_l1599_c7_fe4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond,
t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue,
t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse,
t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_left,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_right,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7
tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond,
tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output);

-- t8_MUX_uxn_opcodes_h_l1602_c7_8cd7
t8_MUX_uxn_opcodes_h_l1602_c7_8cd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond,
t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue,
t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse,
t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2
BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_left,
BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_right,
BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550
BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_left,
BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_right,
BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_return_output);

-- MUX_uxn_opcodes_h_l1605_c32_7fff
MUX_uxn_opcodes_h_l1605_c32_7fff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1605_c32_7fff_cond,
MUX_uxn_opcodes_h_l1605_c32_7fff_iftrue,
MUX_uxn_opcodes_h_l1605_c32_7fff_iffalse,
MUX_uxn_opcodes_h_l1605_c32_7fff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1608_c7_1820
tmp16_MUX_uxn_opcodes_h_l1608_c7_1820 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_cond,
tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue,
tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse,
tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_cond,
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_left,
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_right,
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec
tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond,
tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue,
tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse,
tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5
CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_x,
CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253
BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_left,
BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_right,
BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_left,
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_right,
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7
tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_cond,
tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf
BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_left,
BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_right,
BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_left,
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_right,
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1620_c7_6435
tmp16_MUX_uxn_opcodes_h_l1620_c7_6435 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_cond,
tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue,
tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse,
tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_cond,
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4
BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_left,
BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_right,
BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_left,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_right,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6
CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_x,
CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_left,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_right,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
 t8_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output,
 t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output,
 tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output,
 t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_return_output,
 MUX_uxn_opcodes_h_l1605_c32_7fff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output,
 CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output,
 tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output,
 tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_874c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1600_c3_1532 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1606_c21_fc46_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c21_cdcf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1615_c21_4889_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1618_c21_537c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1623_c3_8750 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1624_c24_ff49_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1627_c3_ce25 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1628_c24_0d24_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1594_l1599_l1602_DUPLICATE_aaad_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_e63b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_b2e6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1626_l1617_l1612_l1608_l1602_DUPLICATE_1edf_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1613_l1621_DUPLICATE_d0cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1635_l1589_DUPLICATE_0157_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1627_c3_ce25 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1627_c3_ce25;
     VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_874c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_874c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1600_c3_1532 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1600_c3_1532;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1623_c3_8750 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1623_c3_8750;

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_2e45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1620_c11_0d71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_e63b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_e63b_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1613_l1621_DUPLICATE_d0cd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1613_l1621_DUPLICATE_d0cd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_b2e6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_b2e6_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_a775] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_left;
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output := BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1594_l1599_l1602_DUPLICATE_aaad LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1594_l1599_l1602_DUPLICATE_aaad_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1612_c11_f37a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_6690] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_left;
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_return_output := BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1605_c32_3ba2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_left;
     BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_return_output := BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1617_c11_9561] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_left;
     BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output := BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1626_l1617_l1612_l1608_l1602_DUPLICATE_1edf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1626_l1617_l1612_l1608_l1602_DUPLICATE_1edf_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1615_c32_f253] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_43b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1628_c34_c6c6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_return_output := CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1610_c21_cdcf] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c21_cdcf_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1606_c21_fc46] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1606_c21_fc46_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1594_c6_eff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1618_c32_7acf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1599_c11_353e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_3ba2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_eff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_353e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_a775_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_43b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_f37a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_9561_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_0d71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_2e45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6690_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1606_c21_fc46_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c21_cdcf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1613_l1621_DUPLICATE_d0cd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1613_l1621_DUPLICATE_d0cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1594_l1599_l1602_DUPLICATE_aaad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1594_l1599_l1602_DUPLICATE_aaad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1594_l1599_l1602_DUPLICATE_aaad_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_b2e6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_b2e6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_b2e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1620_l1617_l1612_l1608_l1602_DUPLICATE_baa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_e63b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_e63b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_e63b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1630_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_cb1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1626_l1617_l1612_l1608_l1602_DUPLICATE_1edf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1626_l1617_l1612_l1608_l1602_DUPLICATE_1edf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1626_l1617_l1612_l1608_l1602_DUPLICATE_1edf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1626_l1617_l1612_l1608_l1602_DUPLICATE_1edf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1626_l1617_l1612_l1608_l1602_DUPLICATE_1edf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1599_l1626_l1594_l1617_l1612_l1608_l1602_DUPLICATE_d7be_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1605_c32_8550] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_left;
     BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_return_output := BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1618_c21_537c] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1618_c21_537c_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_7acf_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1626_c7_65f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_d6b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1615_c21_4889] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1615_c21_4889_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_f253_return_output);

     -- t8_MUX[uxn_opcodes_h_l1602_c7_8cd7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond;
     t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue;
     t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output := t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c7_1820] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1614_c3_5df5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_return_output := CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1628_c24_0d24] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1628_c24_0d24_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_c6c6_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_d6b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1621_c3_abf4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_left;
     BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_return_output := BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_8550_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1615_c21_4889_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1618_c21_537c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1628_c24_0d24_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_5df5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_d6b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1602_c7_8cd7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1620_c7_6435] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_cond;
     tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_return_output := tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_65f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1620_c7_6435] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_65f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1624_c24_ff49] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1624_c24_ff49_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_abf4_return_output);

     -- result_stack_value_MUX[uxn_opcodes_h_l1626_c7_65f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1599_c7_fe4c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond;
     t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue;
     t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output := t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;

     -- MUX[uxn_opcodes_h_l1605_c32_7fff] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1605_c32_7fff_cond <= VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_cond;
     MUX_uxn_opcodes_h_l1605_c32_7fff_iftrue <= VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_iftrue;
     MUX_uxn_opcodes_h_l1605_c32_7fff_iffalse <= VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_return_output := MUX_uxn_opcodes_h_l1605_c32_7fff_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1617_c7_02c7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1624_c24_ff49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue := VAR_MUX_uxn_opcodes_h_l1605_c32_7fff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_65f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1612_c7_b6ec] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1617_c7_02c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1594_c2_6a43] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1594_c2_6a43_cond <= VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_cond;
     t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue;
     t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output := t8_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1620_c7_6435] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1617_c7_02c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_cond;
     tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output := tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1599_c7_fe4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1620_c7_6435] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_return_output := result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1602_c7_8cd7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1620_c7_6435] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6435_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1599_c7_fe4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1594_c2_6a43] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1617_c7_02c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1617_c7_02c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1612_c7_b6ec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond;
     tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output := tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1612_c7_b6ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1617_c7_02c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1608_c7_1820] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_02c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1602_c7_8cd7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1612_c7_b6ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_1820] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1612_c7_b6ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1612_c7_b6ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1594_c2_6a43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1608_c7_1820] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_cond;
     tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_return_output := tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_b6ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1608_c7_1820] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_return_output := result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1599_c7_fe4c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_1820] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1608_c7_1820] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1602_c7_8cd7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond;
     tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output := tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1602_c7_8cd7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_1820_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_8cd7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1602_c7_8cd7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1599_c7_fe4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond;
     tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output := tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1594_c2_6a43] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1599_c7_fe4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_8cd7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_8cd7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1594_c2_6a43] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_cond;
     tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output := tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1599_c7_fe4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1594_c2_6a43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1599_c7_fe4c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1599_c7_fe4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_fe4c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1594_c2_6a43] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output := result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c2_6a43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c2_6a43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1635_l1589_DUPLICATE_0157 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1635_l1589_DUPLICATE_0157_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a287(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_6a43_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1635_l1589_DUPLICATE_0157_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1635_l1589_DUPLICATE_0157_return_output;
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
