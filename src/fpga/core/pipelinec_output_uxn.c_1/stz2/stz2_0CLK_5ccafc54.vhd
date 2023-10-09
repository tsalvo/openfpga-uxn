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
-- Submodules: 96
entity stz2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_5ccafc54;
architecture arch of stz2_0CLK_5ccafc54 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1762_c6_6f04]
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1762_c1_0c61]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal t8_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1762_c2_92ce]
signal n16_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1763_c3_da28[uxn_opcodes_h_l1763_c3_da28]
signal printf_uxn_opcodes_h_l1763_c3_da28_uxn_opcodes_h_l1763_c3_da28_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1768_c11_dc5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1768_c7_9434]
signal t8_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1768_c7_9434]
signal result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1768_c7_9434]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1768_c7_9434]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1768_c7_9434]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1768_c7_9434]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1768_c7_9434]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1768_c7_9434]
signal result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1768_c7_9434]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1768_c7_9434]
signal n16_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_f0fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1771_c7_e381]
signal t8_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1771_c7_e381]
signal result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1771_c7_e381]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_e381]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_e381]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_e381]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_e381]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1771_c7_e381]
signal result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1771_c7_e381]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1771_c7_e381]
signal n16_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_fde1]
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1775_c7_426b]
signal result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1775_c7_426b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_426b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_426b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_426b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_426b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1775_c7_426b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1775_c7_426b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1775_c7_426b]
signal n16_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1778_c11_6ec0]
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1778_c7_f0ff]
signal result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1778_c7_f0ff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1778_c7_f0ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1778_c7_f0ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1778_c7_f0ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1778_c7_f0ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1778_c7_f0ff]
signal result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1778_c7_f0ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1778_c7_f0ff]
signal n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1780_c3_92cd]
signal CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_d500]
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1783_c7_23b0]
signal result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1783_c7_23b0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1783_c7_23b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1783_c7_23b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_23b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_23b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1783_c7_23b0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1783_c7_23b0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1783_c7_23b0]
signal n16_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_b39e]
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1786_c7_5301]
signal result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1786_c7_5301]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_5301]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1786_c7_5301]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_5301]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1786_c7_5301]
signal result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1786_c7_5301]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1786_c7_5301]
signal n16_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1787_c3_a721]
signal BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1790_c32_19ac]
signal BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1790_c32_13d0]
signal BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1790_c32_a28c]
signal MUX_uxn_opcodes_h_l1790_c32_a28c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1790_c32_a28c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1790_c32_a28c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1790_c32_a28c_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1793_c32_1189]
signal CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_9501]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1795_c7_a8f4]
signal result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1795_c7_a8f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_a8f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1795_c7_a8f4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1795_c7_a8f4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1797_c32_1d75]
signal BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_4e18]
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_26dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1800_c7_26dc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fd01( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.ram_addr := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04
BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_left,
BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_right,
BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_return_output);

-- t8_MUX_uxn_opcodes_h_l1762_c2_92ce
t8_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
t8_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce
result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce
result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce
result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce
result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce
result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- n16_MUX_uxn_opcodes_h_l1762_c2_92ce
n16_MUX_uxn_opcodes_h_l1762_c2_92ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1762_c2_92ce_cond,
n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue,
n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse,
n16_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

-- printf_uxn_opcodes_h_l1763_c3_da28_uxn_opcodes_h_l1763_c3_da28
printf_uxn_opcodes_h_l1763_c3_da28_uxn_opcodes_h_l1763_c3_da28 : entity work.printf_uxn_opcodes_h_l1763_c3_da28_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1763_c3_da28_uxn_opcodes_h_l1763_c3_da28_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output);

-- t8_MUX_uxn_opcodes_h_l1768_c7_9434
t8_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
t8_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
t8_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
t8_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- n16_MUX_uxn_opcodes_h_l1768_c7_9434
n16_MUX_uxn_opcodes_h_l1768_c7_9434 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1768_c7_9434_cond,
n16_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue,
n16_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse,
n16_MUX_uxn_opcodes_h_l1768_c7_9434_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output);

-- t8_MUX_uxn_opcodes_h_l1771_c7_e381
t8_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
t8_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
t8_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
t8_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381
result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381
result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381
result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- n16_MUX_uxn_opcodes_h_l1771_c7_e381
n16_MUX_uxn_opcodes_h_l1771_c7_e381 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1771_c7_e381_cond,
n16_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue,
n16_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse,
n16_MUX_uxn_opcodes_h_l1771_c7_e381_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_left,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_right,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b
result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_cond,
result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b
result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_return_output);

-- n16_MUX_uxn_opcodes_h_l1775_c7_426b
n16_MUX_uxn_opcodes_h_l1775_c7_426b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1775_c7_426b_cond,
n16_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue,
n16_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse,
n16_MUX_uxn_opcodes_h_l1775_c7_426b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_left,
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_right,
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff
result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond,
result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff
result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output);

-- n16_MUX_uxn_opcodes_h_l1778_c7_f0ff
n16_MUX_uxn_opcodes_h_l1778_c7_f0ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond,
n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue,
n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse,
n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd
CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_x,
CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_left,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_right,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0
result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_cond,
result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0
result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output);

-- n16_MUX_uxn_opcodes_h_l1783_c7_23b0
n16_MUX_uxn_opcodes_h_l1783_c7_23b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1783_c7_23b0_cond,
n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue,
n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse,
n16_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_left,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_right,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301
result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_cond,
result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301
result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_return_output);

-- n16_MUX_uxn_opcodes_h_l1786_c7_5301
n16_MUX_uxn_opcodes_h_l1786_c7_5301 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1786_c7_5301_cond,
n16_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue,
n16_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse,
n16_MUX_uxn_opcodes_h_l1786_c7_5301_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721
BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_left,
BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_right,
BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac
BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_left,
BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_right,
BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0
BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_left,
BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_right,
BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_return_output);

-- MUX_uxn_opcodes_h_l1790_c32_a28c
MUX_uxn_opcodes_h_l1790_c32_a28c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1790_c32_a28c_cond,
MUX_uxn_opcodes_h_l1790_c32_a28c_iftrue,
MUX_uxn_opcodes_h_l1790_c32_a28c_iffalse,
MUX_uxn_opcodes_h_l1790_c32_a28c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1793_c32_1189
CONST_SR_8_uxn_opcodes_h_l1793_c32_1189 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_x,
CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4
result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond,
result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4
result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4
result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75
BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_left,
BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_right,
BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_left,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_right,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_return_output,
 t8_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 n16_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output,
 t8_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 n16_MUX_uxn_opcodes_h_l1768_c7_9434_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output,
 t8_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 n16_MUX_uxn_opcodes_h_l1771_c7_e381_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_return_output,
 n16_MUX_uxn_opcodes_h_l1775_c7_426b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output,
 n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output,
 CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output,
 n16_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_return_output,
 n16_MUX_uxn_opcodes_h_l1786_c7_5301_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_return_output,
 MUX_uxn_opcodes_h_l1790_c32_a28c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_843d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1763_c3_da28_uxn_opcodes_h_l1763_c3_da28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_4d89 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_89f9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_5a4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1781_c3_04f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_56ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_c7_23b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1792_c21_612e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1793_c22_8b29_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1797_c21_c33e_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c22_4047_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1786_l1783_DUPLICATE_bc11_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1787_l1779_DUPLICATE_0882_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1805_l1756_DUPLICATE_a957_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_5a4a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_5a4a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_89f9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_89f9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_843d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_843d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_56ef := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_56ef;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_4d89 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_4d89;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1781_c3_04f6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1781_c3_04f6;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1778_c11_6ec0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_b39e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_9501] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_fde1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1798_c22_4047] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c22_4047_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1762_c6_6f04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_left;
     BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output := BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_4e18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_left;
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_return_output := BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1768_c11_dc5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1792_c21_612e] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1792_c21_612e_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1786_l1783_DUPLICATE_bc11 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1786_l1783_DUPLICATE_bc11_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1790_c32_19ac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_left;
     BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_return_output := BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_d500] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_left;
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output := BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_f0fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1797_c32_1d75] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_c7_23b0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1787_l1779_DUPLICATE_0882 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1787_l1779_DUPLICATE_0882_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1790_c32_19ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c6_6f04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_dc5d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_f0fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_fde1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6ec0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d500_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_b39e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_9501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_4e18_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1792_c21_612e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1787_l1779_DUPLICATE_0882_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1787_l1779_DUPLICATE_0882_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c22_4047_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1762_l1786_l1783_DUPLICATE_9c61_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_38fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1786_l1783_DUPLICATE_4faf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1800_l1768_l1795_l1762_l1783_DUPLICATE_86fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_a124_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1786_l1783_DUPLICATE_bc11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1786_l1783_DUPLICATE_bc11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1786_l1783_DUPLICATE_bc11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1786_l1783_DUPLICATE_bc11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1786_l1783_DUPLICATE_bc11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1786_l1783_DUPLICATE_bc11_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1778_l1775_l1771_l1768_l1795_l1762_l1783_DUPLICATE_9a8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_c7_23b0_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1800_c7_26dc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1797_c21_c33e] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1797_c21_c33e_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c32_1d75_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1787_c3_a721] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_left;
     BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_return_output := BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1762_c1_0c61] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1795_c7_a8f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_26dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1795_c7_a8f4] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output := result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1786_c7_5301] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1780_c3_92cd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_return_output := CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1790_c32_13d0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_left;
     BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_return_output := BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_return_output;

     -- t8_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     t8_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     t8_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := t8_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1790_c32_13d0_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1787_c3_a721_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1797_c21_c33e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1780_c3_92cd_return_output;
     VAR_printf_uxn_opcodes_h_l1763_c3_da28_uxn_opcodes_h_l1763_c3_da28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1762_c1_0c61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_26dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     -- printf_uxn_opcodes_h_l1763_c3_da28[uxn_opcodes_h_l1763_c3_da28] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1763_c3_da28_uxn_opcodes_h_l1763_c3_da28_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1763_c3_da28_uxn_opcodes_h_l1763_c3_da28_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1786_c7_5301] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1793_c32_1189] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_return_output := CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_return_output;

     -- MUX[uxn_opcodes_h_l1790_c32_a28c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1790_c32_a28c_cond <= VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_cond;
     MUX_uxn_opcodes_h_l1790_c32_a28c_iftrue <= VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_iftrue;
     MUX_uxn_opcodes_h_l1790_c32_a28c_iffalse <= VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_return_output := MUX_uxn_opcodes_h_l1790_c32_a28c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1795_c7_a8f4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     t8_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     t8_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := t8_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1778_c7_f0ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_a8f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1795_c7_a8f4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1786_c7_5301] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1786_c7_5301_cond <= VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_cond;
     n16_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue;
     n16_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_return_output := n16_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue := VAR_MUX_uxn_opcodes_h_l1790_c32_a28c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1795_c7_a8f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_5301] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;

     -- n16_MUX[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1783_c7_23b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_cond;
     n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue;
     n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output := n16_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_426b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1786_c7_5301] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1786_c7_5301] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1778_c7_f0ff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_5301] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1793_c22_8b29] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1793_c22_8b29_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1793_c32_1189_return_output);

     -- t8_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := t8_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1793_c22_8b29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1778_c7_f0ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond;
     n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue;
     n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output := n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1778_c7_f0ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1775_c7_426b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1786_c7_5301] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_return_output := result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1786_c7_5301_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     -- n16_MUX[uxn_opcodes_h_l1775_c7_426b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1775_c7_426b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_cond;
     n16_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue;
     n16_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_return_output := n16_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1778_c7_f0ff] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1783_c7_23b0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output := result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_426b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1778_c7_f0ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1778_c7_f0ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1778_c7_f0ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1783_c7_23b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_426b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1775_c7_426b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1775_c7_426b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_426b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- n16_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     n16_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     n16_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := n16_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1778_c7_f0ff] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output := result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1778_c7_f0ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1775_c7_426b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_return_output := result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- n16_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     n16_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     n16_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := n16_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1775_c7_426b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1771_c7_e381] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_return_output := result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;

     -- n16_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := n16_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1771_c7_e381_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1768_c7_9434] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_return_output := result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- Submodule level 10
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_9434_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1762_c2_92ce] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output := result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1805_l1756_DUPLICATE_a957 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1805_l1756_DUPLICATE_a957_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fd01(
     result,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1762_c2_92ce_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1805_l1756_DUPLICATE_a957_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1805_l1756_DUPLICATE_a957_return_output;
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
