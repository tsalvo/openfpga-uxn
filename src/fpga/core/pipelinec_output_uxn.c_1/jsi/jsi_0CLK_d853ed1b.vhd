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
-- Submodules: 93
entity jsi_0CLK_d853ed1b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_d853ed1b;
architecture arch of jsi_0CLK_d853ed1b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l105_c6_a3d8]
signal BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l105_c1_0171]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l105_c2_01b9]
signal tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(15 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l105_c2_01b9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l106_c3_cb7c[uxn_opcodes_h_l106_c3_cb7c]
signal printf_uxn_opcodes_h_l106_c3_cb7c_uxn_opcodes_h_l106_c3_cb7c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l108_c15_981c]
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l109_c11_3b81]
signal BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l112_c11_b53c]
signal BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l112_c7_a19a]
signal tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l112_c7_a19a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l116_c26_b4e6]
signal BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_aa75]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l119_c7_7bcd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l121_c26_6b3b]
signal BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l122_c34_d7cc]
signal CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l124_c11_b844]
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l124_c7_fc6a]
signal tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_fc6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l124_c7_fc6a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_fc6a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l124_c7_fc6a]
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l124_c7_fc6a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l124_c7_fc6a]
signal result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l129_c11_93ec]
signal BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l129_c7_c93c]
signal tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l129_c7_c93c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l129_c7_c93c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l129_c7_c93c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l129_c7_c93c]
signal result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l129_c7_c93c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l129_c7_c93c]
signal result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l134_c11_f26f]
signal BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l134_c7_b4e2]
signal tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l134_c7_b4e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l134_c7_b4e2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l134_c7_b4e2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l134_c7_b4e2]
signal result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l134_c7_b4e2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l134_c7_b4e2]
signal result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l139_c21_b610]
signal BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l141_c11_a2be]
signal BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l141_c7_1a0c]
signal tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l141_c7_1a0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l141_c7_1a0c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l141_c7_1a0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l141_c7_1a0c]
signal result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l141_c7_1a0c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l141_c7_1a0c]
signal result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l144_c21_c96a]
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l146_c11_1e1b]
signal BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l146_c7_44a7]
signal tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l146_c7_44a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l146_c7_44a7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l146_c7_44a7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l146_c7_44a7]
signal result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l146_c7_44a7]
signal result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l147_c3_2111]
signal BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l151_c15_b069]
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l151_c15_8194]
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4937( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.pc := ref_toks_5;
      base.sp := ref_toks_6;
      base.stack_address := ref_toks_7;
      base.is_ram_read := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_sp_updated := ref_toks_10;
      base.ram_addr := ref_toks_11;
      base.is_ram_write := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8
BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_left,
BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_right,
BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_return_output);

-- tmp16_MUX_uxn_opcodes_h_l105_c2_01b9
tmp16_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9
result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9
result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9
result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9
result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l105_c2_01b9
result_pc_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_sp_MUX_uxn_opcodes_h_l105_c2_01b9
result_sp_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9
result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9
result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9
result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9
result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9
result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

-- printf_uxn_opcodes_h_l106_c3_cb7c_uxn_opcodes_h_l106_c3_cb7c
printf_uxn_opcodes_h_l106_c3_cb7c_uxn_opcodes_h_l106_c3_cb7c : entity work.printf_uxn_opcodes_h_l106_c3_cb7c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l106_c3_cb7c_uxn_opcodes_h_l106_c3_cb7c_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c
BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c : entity work.BIN_OP_PLUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_left,
BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_right,
BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81
BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_left,
BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_right,
BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c
BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_left,
BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_right,
BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l112_c7_a19a
tmp16_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a
result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a
result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a
result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a
result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l112_c7_a19a
result_pc_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a
result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a
result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a
result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a
result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a
result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a
result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6
BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_left,
BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_right,
BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75
BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd
tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd
result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd
result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd
result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd
result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd
result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd
result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b
BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_left,
BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_right,
BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc
CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_x,
CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844
BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_left,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_right,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output);

-- tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a
tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_cond,
tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue,
tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse,
tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a
result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a
result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a
result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_cond,
result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue,
result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse,
result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec
BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_left,
BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_right,
BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l129_c7_c93c
tmp16_MUX_uxn_opcodes_h_l129_c7_c93c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_cond,
tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue,
tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse,
tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c
result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c
result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c
result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l129_c7_c93c
result_pc_MUX_uxn_opcodes_h_l129_c7_c93c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_cond,
result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue,
result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse,
result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f
BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_left,
BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_right,
BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2
tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_cond,
tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2
result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2
result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2
result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_cond,
result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue,
result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse,
result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610
BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_left,
BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_right,
BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be
BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_left,
BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_right,
BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output);

-- tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c
tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_cond,
tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c
result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c
result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c
result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c
result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c
result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c
result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_cond,
result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue,
result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse,
result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a
BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_left,
BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_right,
BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b
BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_left,
BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_right,
BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l146_c7_44a7
tmp16_MUX_uxn_opcodes_h_l146_c7_44a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_cond,
tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7
result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7
result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7
result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l146_c7_44a7
result_pc_MUX_uxn_opcodes_h_l146_c7_44a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_cond,
result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue,
result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse,
result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l147_c3_2111
BIN_OP_OR_uxn_opcodes_h_l147_c3_2111 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_left,
BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_right,
BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069
BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_left,
BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_right,
BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194
BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_left,
BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_right,
BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 stack_index,
 pc,
 sp,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_return_output,
 tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output,
 tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_return_output,
 CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output,
 tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output,
 result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_return_output,
 result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output,
 tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output,
 result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output,
 tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output,
 result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output,
 tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_return_output,
 result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l109_c3_3716 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_uxn_opcodes_h_l108_c3_6edd : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l106_c3_cb7c_uxn_opcodes_h_l106_c3_cb7c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l112_c7_a19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l117_c24_c253_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l122_c24_86c0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l139_c3_b863 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l144_c3_f0bf : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l149_c3_a00f : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l151_c3_be0f : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_88ad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l105_l112_DUPLICATE_b3ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_a965_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_b338_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_b1de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_d5a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l119_l105_l141_l112_DUPLICATE_050f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l135_l147_DUPLICATE_91a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l101_l158_DUPLICATE_a036_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_right := to_unsigned(7, 3);
     VAR_result_ram_addr_uxn_opcodes_h_l149_c3_a00f := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l149_c3_a00f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_stack_index := stack_index;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_left := VAR_sp;
     VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l139_c21_b610] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_left;
     BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_return_output := BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_return_output;

     -- result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l105_c2_01b9_return_output := result.sp;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_b1de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_b1de_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l141_c11_a2be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_left;
     BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output := BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l116_c26_b4e6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_left;
     BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_return_output := BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l117_c24_c253] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l117_c24_c253_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l112_c11_b53c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_left;
     BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output := BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8_return_output := result.is_opc_done;

     -- result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l112_c7_a19a_return_output := result.is_sp_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l108_c15_981c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l146_c11_1e1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l119_l105_l141_l112_DUPLICATE_050f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l119_l105_l141_l112_DUPLICATE_050f_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l122_c34_d7cc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_return_output := CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_d5a6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_d5a6_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l129_c11_93ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l105_l112_DUPLICATE_b3ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l105_l112_DUPLICATE_b3ce_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l105_c6_a3d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l134_c11_f26f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_left;
     BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output := BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l109_c11_3b81] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_left;
     BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_return_output := BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l135_l147_DUPLICATE_91a9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l135_l147_DUPLICATE_91a9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l124_c11_b844] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_left;
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output := BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_aa75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_a965 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_a965_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output := result.pc;

     -- BIN_OP_MINUS[uxn_opcodes_h_l121_c26_6b3b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_left;
     BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_return_output := BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_b338 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_b338_return_output := result.stack_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l144_c21_c96a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_88ad LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_88ad_return_output := result.stack_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c6_a3d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l112_c11_b53c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_aa75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_b844_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_93ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_f26f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l141_c11_a2be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c11_1e1b_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l116_c26_b4e6_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l121_c26_6b3b_return_output;
     VAR_result_sp_uxn_opcodes_h_l108_c3_6edd := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c15_981c_return_output, 8);
     VAR_tmp16_uxn_opcodes_h_l109_c3_3716 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l109_c11_3b81_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l139_c3_b863 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l139_c21_b610_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l144_c3_f0bf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c21_c96a_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l135_l147_DUPLICATE_91a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l135_l147_DUPLICATE_91a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l117_c24_c253_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l146_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_57f8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_d5a6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_d5a6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_d5a6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_d5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l146_l141_l134_l129_l124_l119_l112_DUPLICATE_21e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l105_l141_l134_l129_l124_l119_l112_DUPLICATE_e992_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_b1de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_b1de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_b1de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l146_l119_l105_l112_DUPLICATE_b1de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l119_l105_l141_l112_DUPLICATE_050f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l119_l105_l141_l112_DUPLICATE_050f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l119_l105_l141_l112_DUPLICATE_050f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l119_l105_l141_l112_DUPLICATE_050f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l105_l112_DUPLICATE_b3ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l105_l112_DUPLICATE_b3ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_a965_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_a965_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_b338_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_b338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_88ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l119_l105_DUPLICATE_88ad_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l105_c2_01b9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l139_c3_b863;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l144_c3_f0bf;
     VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_result_sp_uxn_opcodes_h_l108_c3_6edd;
     VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue := VAR_tmp16_uxn_opcodes_h_l109_c3_3716;
     -- result_stack_address_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l146_c7_44a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l146_c7_44a7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l141_c7_1a0c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l146_c7_44a7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l105_c1_0171] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l122_c24_86c0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l122_c24_86c0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l122_c34_d7cc_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l147_c3_2111] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_left;
     BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_return_output := BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l146_c7_44a7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_right := VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l147_c3_2111_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l122_c24_86c0_return_output;
     VAR_printf_uxn_opcodes_h_l106_c3_cb7c_uxn_opcodes_h_l106_c3_cb7c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l105_c1_0171_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     -- result_stack_address_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l141_c7_1a0c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l146_c7_44a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_cond;
     tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_return_output := tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;

     -- printf_uxn_opcodes_h_l106_c3_cb7c[uxn_opcodes_h_l106_c3_cb7c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l106_c3_cb7c_uxn_opcodes_h_l106_c3_cb7c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l106_c3_cb7c_uxn_opcodes_h_l106_c3_cb7c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l141_c7_1a0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l151_c15_b069] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_left;
     BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_return_output := BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l141_c7_1a0c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l141_c7_1a0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l134_c7_b4e2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_b069_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l151_c15_8194] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_left;
     BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_return_output := BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l134_c7_b4e2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l134_c7_b4e2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l129_c7_c93c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l134_c7_b4e2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l141_c7_1a0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_cond;
     tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output := tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l134_c7_b4e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l151_c3_be0f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c15_8194_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue := VAR_result_pc_uxn_opcodes_h_l151_c3_be0f;
     -- result_pc_MUX[uxn_opcodes_h_l146_c7_44a7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_cond;
     result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_return_output := result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l129_c7_c93c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l129_c7_c93c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l129_c7_c93c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l129_c7_c93c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l124_c7_fc6a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l134_c7_b4e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_cond;
     tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output := tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l146_c7_44a7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_fc6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l124_c7_fc6a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_fc6a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l141_c7_1a0c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_cond;
     result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output := result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l124_c7_fc6a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l129_c7_c93c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_cond;
     tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_return_output := tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l141_c7_1a0c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l124_c7_fc6a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_cond;
     tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output := tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l134_c7_b4e2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_cond;
     result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output := result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_b4e2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l129_c7_c93c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_cond;
     result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_return_output := result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_c93c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l124_c7_fc6a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_cond;
     result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output := result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_fc6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l119_c7_7bcd] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_cond;
     result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iftrue;
     result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output := result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_7bcd_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l112_c7_a19a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_cond;
     result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_return_output := result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l112_c7_a19a_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l105_c2_01b9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_cond;
     result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_return_output := result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l101_l158_DUPLICATE_a036 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l101_l158_DUPLICATE_a036_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4937(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_sp_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_stack_address_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l105_c2_01b9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l105_c2_01b9_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l101_l158_DUPLICATE_a036_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4937_uxn_opcodes_h_l101_l158_DUPLICATE_a036_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
