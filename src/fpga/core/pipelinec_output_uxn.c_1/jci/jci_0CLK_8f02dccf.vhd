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
-- Submodules: 79
entity jci_0CLK_8f02dccf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_8f02dccf;
architecture arch of jci_0CLK_8f02dccf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l70_c6_48aa]
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_e293]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l70_c2_14b5]
signal t8_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l70_c2_14b5]
signal result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_14b5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_14b5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_14b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_14b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_14b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_14b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_14b5]
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_14b5]
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l70_c2_14b5]
signal tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l71_c3_92f0[uxn_opcodes_h_l71_c3_92f0]
signal printf_uxn_opcodes_h_l71_c3_92f0_uxn_opcodes_h_l71_c3_92f0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_0272]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_5f84]
signal t8_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l76_c7_5f84]
signal result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_5f84]
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_5f84]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_5f84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_5f84]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_5f84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_5f84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_5f84]
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_5f84]
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_5f84]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l79_c11_f881]
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l79_c7_4580]
signal t8_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l79_c7_4580]
signal result_pc_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_4580]
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_4580]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_4580]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_4580]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_4580]
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_4580]
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_4580]
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l79_c7_4580]
signal tmp16_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l87_c11_0d16]
signal BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l87_c7_b683]
signal result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l87_c7_b683]
signal result_pc_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l87_c7_b683]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l87_c7_b683]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l87_c7_b683]
signal result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l87_c7_b683]
signal result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l87_c7_b683]
signal tmp16_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l91_c11_c084]
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l91_c7_cf04]
signal result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l91_c7_cf04]
signal result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_cf04]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_cf04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l91_c7_cf04]
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l91_c7_cf04]
signal tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_4b5b]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l94_c21_6349]
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_13ad]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l96_c7_0574]
signal result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l96_c7_0574]
signal result_pc_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_0574]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_0574]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l96_c7_0574]
signal result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_0574]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c21_b9a4]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_8e20]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l99_c7_e523]
signal result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l99_c7_e523]
signal result_pc_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_e523]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_e523]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l99_c7_e523]
signal tmp16_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l100_c3_1aff]
signal BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l103_c15_5a21]
signal BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l103_c25_05b9]
signal BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l103_c35_799f]
signal BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l103_c35_0bc9]
signal BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l103_c15_cba8]
signal MUX_uxn_opcodes_h_l103_c15_cba8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l103_c15_cba8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l103_c15_cba8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l103_c15_cba8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l105_c11_67be]
signal BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l105_c7_4e74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l105_c7_4e74]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_373a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.pc := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_read := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa
BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_left,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_right,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_return_output);

-- t8_MUX_uxn_opcodes_h_l70_c2_14b5
t8_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
t8_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
t8_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
t8_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l70_c2_14b5
result_pc_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l70_c2_14b5
tmp16_MUX_uxn_opcodes_h_l70_c2_14b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_cond,
tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue,
tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse,
tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

-- printf_uxn_opcodes_h_l71_c3_92f0_uxn_opcodes_h_l71_c3_92f0
printf_uxn_opcodes_h_l71_c3_92f0_uxn_opcodes_h_l71_c3_92f0 : entity work.printf_uxn_opcodes_h_l71_c3_92f0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l71_c3_92f0_uxn_opcodes_h_l71_c3_92f0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272
BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_5f84
t8_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
t8_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- result_pc_MUX_uxn_opcodes_h_l76_c7_5f84
result_pc_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_5f84
tmp16_MUX_uxn_opcodes_h_l76_c7_5f84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881
BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_left,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_right,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output);

-- t8_MUX_uxn_opcodes_h_l79_c7_4580
t8_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l79_c7_4580_cond,
t8_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
t8_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
t8_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- result_pc_MUX_uxn_opcodes_h_l79_c7_4580
result_pc_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l79_c7_4580_cond,
result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
result_pc_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_cond,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- tmp16_MUX_uxn_opcodes_h_l79_c7_4580
tmp16_MUX_uxn_opcodes_h_l79_c7_4580 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l79_c7_4580_cond,
tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iftrue,
tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iffalse,
tmp16_MUX_uxn_opcodes_h_l79_c7_4580_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16
BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_left,
BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_right,
BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683
result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_return_output);

-- result_pc_MUX_uxn_opcodes_h_l87_c7_b683
result_pc_MUX_uxn_opcodes_h_l87_c7_b683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l87_c7_b683_cond,
result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iftrue,
result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iffalse,
result_pc_MUX_uxn_opcodes_h_l87_c7_b683_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683
result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683
result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683
result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683
result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_cond,
result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_return_output);

-- tmp16_MUX_uxn_opcodes_h_l87_c7_b683
tmp16_MUX_uxn_opcodes_h_l87_c7_b683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l87_c7_b683_cond,
tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iftrue,
tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iffalse,
tmp16_MUX_uxn_opcodes_h_l87_c7_b683_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084
BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_left,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_right,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04
result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_return_output);

-- result_pc_MUX_uxn_opcodes_h_l91_c7_cf04
result_pc_MUX_uxn_opcodes_h_l91_c7_cf04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_cond,
result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue,
result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse,
result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_cond,
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_return_output);

-- tmp16_MUX_uxn_opcodes_h_l91_c7_cf04
tmp16_MUX_uxn_opcodes_h_l91_c7_cf04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_cond,
tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue,
tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse,
tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b
CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349
BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_left,
BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_right,
BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad
BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574
result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_return_output);

-- result_pc_MUX_uxn_opcodes_h_l96_c7_0574
result_pc_MUX_uxn_opcodes_h_l96_c7_0574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l96_c7_0574_cond,
result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iftrue,
result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iffalse,
result_pc_MUX_uxn_opcodes_h_l96_c7_0574_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574
result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_cond,
result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_0574
tmp16_MUX_uxn_opcodes_h_l96_c7_0574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_0574_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_0574_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4
BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523
result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_return_output);

-- result_pc_MUX_uxn_opcodes_h_l99_c7_e523
result_pc_MUX_uxn_opcodes_h_l99_c7_e523 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l99_c7_e523_cond,
result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iftrue,
result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iffalse,
result_pc_MUX_uxn_opcodes_h_l99_c7_e523_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_return_output);

-- tmp16_MUX_uxn_opcodes_h_l99_c7_e523
tmp16_MUX_uxn_opcodes_h_l99_c7_e523 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l99_c7_e523_cond,
tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iftrue,
tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iffalse,
tmp16_MUX_uxn_opcodes_h_l99_c7_e523_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff
BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_left,
BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_right,
BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21
BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_left,
BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_right,
BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9
BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_left,
BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_right,
BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f
BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_left,
BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_right,
BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9
BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_left,
BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_right,
BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_return_output);

-- MUX_uxn_opcodes_h_l103_c15_cba8
MUX_uxn_opcodes_h_l103_c15_cba8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l103_c15_cba8_cond,
MUX_uxn_opcodes_h_l103_c15_cba8_iftrue,
MUX_uxn_opcodes_h_l103_c15_cba8_iffalse,
MUX_uxn_opcodes_h_l103_c15_cba8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be
BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_left,
BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_right,
BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74
result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_return_output,
 t8_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output,
 t8_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 result_pc_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 tmp16_MUX_uxn_opcodes_h_l79_c7_4580_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_return_output,
 result_pc_MUX_uxn_opcodes_h_l87_c7_b683_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_return_output,
 tmp16_MUX_uxn_opcodes_h_l87_c7_b683_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_return_output,
 result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_return_output,
 tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_return_output,
 result_pc_MUX_uxn_opcodes_h_l96_c7_0574_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_0574_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_return_output,
 result_pc_MUX_uxn_opcodes_h_l99_c7_e523_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_return_output,
 tmp16_MUX_uxn_opcodes_h_l99_c7_e523_return_output,
 BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_return_output,
 MUX_uxn_opcodes_h_l103_c15_cba8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_2a09 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l71_c3_92f0_uxn_opcodes_h_l71_c3_92f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_644a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_5f84_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_90f2 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l94_c3_71cf : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l97_c3_b319 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l103_c15_cba8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l103_c15_cba8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l103_c15_cba8_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l103_c15_cba8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l70_l79_DUPLICATE_7ede_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l87_l76_l70_DUPLICATE_27f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l96_l87_l99_l70_l91_DUPLICATE_f5ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l96_l76_l70_DUPLICATE_6dba_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_ab07_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l100_l92_DUPLICATE_f3d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_373a_uxn_opcodes_h_l110_l65_DUPLICATE_ff1a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_right := to_unsigned(4, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_644a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_644a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_2a09 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_2a09;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_90f2 := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_90f2;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l87_l76_l70_DUPLICATE_27f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l87_l76_l70_DUPLICATE_27f9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_13ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l100_l92_DUPLICATE_f3d9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l100_l92_DUPLICATE_f3d9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l96_l87_l99_l70_l91_DUPLICATE_f5ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l96_l87_l99_l70_l91_DUPLICATE_f5ab_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l87_c11_0d16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_left;
     BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output := BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l94_c21_6349] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_left;
     BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_return_output := BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c21_b9a4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l70_l79_DUPLICATE_7ede LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l70_l79_DUPLICATE_7ede_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l96_l76_l70_DUPLICATE_6dba LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l96_l76_l70_DUPLICATE_6dba_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l70_c6_48aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_0272] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_8e20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_ab07 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_ab07_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l79_c11_f881] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_left;
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output := BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l105_c11_67be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_left;
     BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_return_output := BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l103_c25_05b9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_5f84_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l91_c11_c084] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_left;
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output := BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l103_c15_5a21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_left;
     BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_return_output := BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l103_c15_cba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l103_c15_5a21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c11_67be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_48aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_0272_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f881_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l87_c11_0d16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_c084_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_13ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8e20_return_output;
     VAR_MUX_uxn_opcodes_h_l103_c15_cba8_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c25_05b9_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l94_c3_71cf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_6349_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l97_c3_b319 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c21_b9a4_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l100_l92_DUPLICATE_f3d9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l100_l92_DUPLICATE_f3d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l70_l79_DUPLICATE_7ede_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l70_l79_DUPLICATE_7ede_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l70_l79_DUPLICATE_7ede_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l70_l91_DUPLICATE_58b6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l96_l76_l70_DUPLICATE_6dba_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l96_l76_l70_DUPLICATE_6dba_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l96_l76_l70_DUPLICATE_6dba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l96_l87_l99_l79_l105_l91_DUPLICATE_d3fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l96_l87_l79_l70_l105_l91_DUPLICATE_37e1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l96_l87_l99_l70_l91_DUPLICATE_f5ab_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l96_l87_l99_l70_l91_DUPLICATE_f5ab_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l96_l87_l99_l70_l91_DUPLICATE_f5ab_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l96_l87_l99_l70_l91_DUPLICATE_f5ab_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l96_l87_l99_l70_l91_DUPLICATE_f5ab_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l96_l87_l99_l70_l91_DUPLICATE_f5ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l87_l76_l70_DUPLICATE_27f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l87_l76_l70_DUPLICATE_27f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l87_l76_l70_DUPLICATE_27f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_ab07_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_ab07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l94_c3_71cf;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l97_c3_b319;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l87_c7_b683] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l99_c7_e523] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_4b5b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l105_c7_4e74] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l96_c7_0574] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_return_output := result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l105_c7_4e74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_return_output;

     -- t8_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     t8_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     t8_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_return_output := t8_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l100_c3_1aff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_left;
     BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_return_output := BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_e293] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_1aff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_4b5b_return_output;
     VAR_printf_uxn_opcodes_h_l71_c3_92f0_uxn_opcodes_h_l71_c3_92f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l105_c7_4e74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l105_c7_4e74_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l99_c7_e523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l87_c7_b683_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l96_c7_0574_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_t8_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_e523] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_return_output;

     -- t8_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := t8_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- printf_uxn_opcodes_h_l71_c3_92f0[uxn_opcodes_h_l71_c3_92f0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l71_c3_92f0_uxn_opcodes_h_l71_c3_92f0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l71_c3_92f0_uxn_opcodes_h_l71_c3_92f0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l96_c7_0574] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l103_c35_799f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l99_c7_e523] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l99_c7_e523_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_cond;
     tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iftrue;
     tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_return_output := tmp16_MUX_uxn_opcodes_h_l99_c7_e523_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l91_c7_cf04] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_return_output := result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_e523] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_799f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e523_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e523_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l96_c7_0574_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_e523_return_output;
     -- t8_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     t8_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     t8_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := t8_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l91_c7_cf04] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_0574] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_0574] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_0574_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_0574_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l87_c7_b683] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_return_output := result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l103_c35_0bc9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_0574] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l103_c15_cba8_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l103_c35_0bc9_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0574_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0574_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l87_c7_b683_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_0574_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l91_c7_cf04] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_cond;
     tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue;
     tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_return_output := tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_cf04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;

     -- MUX[uxn_opcodes_h_l103_c15_cba8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l103_c15_cba8_cond <= VAR_MUX_uxn_opcodes_h_l103_c15_cba8_cond;
     MUX_uxn_opcodes_h_l103_c15_cba8_iftrue <= VAR_MUX_uxn_opcodes_h_l103_c15_cba8_iftrue;
     MUX_uxn_opcodes_h_l103_c15_cba8_iffalse <= VAR_MUX_uxn_opcodes_h_l103_c15_cba8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l103_c15_cba8_return_output := MUX_uxn_opcodes_h_l103_c15_cba8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l87_c7_b683] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_return_output := result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_cf04] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iftrue := VAR_MUX_uxn_opcodes_h_l103_c15_cba8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l87_c7_b683_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l87_c7_b683] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l87_c7_b683_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_cond;
     tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iftrue;
     tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_return_output := tmp16_MUX_uxn_opcodes_h_l87_c7_b683_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l87_c7_b683] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l87_c7_b683] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l99_c7_e523] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l99_c7_e523_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_cond;
     result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iftrue;
     result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_return_output := result_pc_MUX_uxn_opcodes_h_l99_c7_e523_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l87_c7_b683_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l87_c7_b683_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l99_c7_e523_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l87_c7_b683_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l96_c7_0574] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l96_c7_0574_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_cond;
     result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iftrue;
     result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_return_output := result_pc_MUX_uxn_opcodes_h_l96_c7_0574_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_return_output := tmp16_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_0574_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l91_c7_cf04] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_cond;
     result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iftrue;
     result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_return_output := result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_cf04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l87_c7_b683] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l87_c7_b683_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_cond;
     result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iftrue;
     result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_return_output := result_pc_MUX_uxn_opcodes_h_l87_c7_b683_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l87_c7_b683_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l79_c7_4580] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l79_c7_4580_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_cond;
     result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iftrue;
     result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_return_output := result_pc_MUX_uxn_opcodes_h_l79_c7_4580_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_4580_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l76_c7_5f84] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_cond;
     result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iftrue;
     result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_return_output := result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5f84_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l70_c2_14b5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_cond;
     result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_return_output := result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_373a_uxn_opcodes_h_l110_l65_DUPLICATE_ff1a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_373a_uxn_opcodes_h_l110_l65_DUPLICATE_ff1a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_373a(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_14b5_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_14b5_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_373a_uxn_opcodes_h_l110_l65_DUPLICATE_ff1a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_373a_uxn_opcodes_h_l110_l65_DUPLICATE_ff1a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
