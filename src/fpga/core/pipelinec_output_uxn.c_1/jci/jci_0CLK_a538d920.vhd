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
-- Submodules: 107
entity jci_0CLK_a538d920 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_a538d920;
architecture arch of jci_0CLK_a538d920 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l70_c6_71d8]
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_ca9a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l70_c2_fca1]
signal tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l70_c2_fca1]
signal t8_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_fca1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l71_c3_34ef[uxn_opcodes_h_l71_c3_34ef]
signal printf_uxn_opcodes_h_l71_c3_34ef_uxn_opcodes_h_l71_c3_34ef_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l78_c11_59e8]
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal t8_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l78_c7_a6e0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l83_c11_038c]
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l83_c7_15e9]
signal tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l83_c7_15e9]
signal t8_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l83_c7_15e9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l89_c11_00a1]
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l89_c7_0c7c]
signal tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_0c7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l89_c7_0c7c]
signal result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l89_c7_0c7c]
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l89_c7_0c7c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l89_c7_0c7c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l89_c7_0c7c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l89_c7_0c7c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_0c7c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l93_c11_bc9e]
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l93_c7_f56c]
signal tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_f56c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l93_c7_f56c]
signal result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_f56c]
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_f56c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l93_c7_f56c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l93_c7_f56c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l93_c7_f56c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_f56c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l100_c11_df85]
signal BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l100_c7_fbda]
signal tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l100_c7_fbda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l100_c7_fbda]
signal result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l100_c7_fbda]
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l100_c7_fbda]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l100_c7_fbda]
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l104_c11_532f]
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l104_c7_a403]
signal tmp16_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l104_c7_a403]
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l104_c7_a403]
signal result_pc_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l104_c7_a403]
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l104_c7_a403]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l104_c7_a403]
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l106_c3_f5a9]
signal CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l108_c21_88b3]
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l110_c11_cbaf]
signal BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l110_c7_6eeb]
signal tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l110_c7_6eeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l110_c7_6eeb]
signal result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l110_c7_6eeb]
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c7_6eeb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l110_c7_6eeb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l112_c21_f003]
signal BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l114_c11_9318]
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l114_c7_fcd1]
signal tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_fcd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l114_c7_fcd1]
signal result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l114_c7_fcd1]
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_fcd1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l114_c7_fcd1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l115_c3_8a3b]
signal BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c15_28ab]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l119_c25_fc5d]
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_c421]
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_94e0]
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l119_c15_0bd2]
signal MUX_uxn_opcodes_h_l119_c15_0bd2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l119_c15_0bd2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l119_c15_0bd2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l119_c15_0bd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l121_c11_511d]
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_6622]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_6622]
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_62ce( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.pc := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;
      base.is_sp_shift := ref_toks_11;
      base.is_pc_updated := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8
BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_left,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_right,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l70_c2_fca1
tmp16_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- t8_MUX_uxn_opcodes_h_l70_c2_fca1
t8_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
t8_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
t8_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
t8_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l70_c2_fca1
result_pc_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

-- printf_uxn_opcodes_h_l71_c3_34ef_uxn_opcodes_h_l71_c3_34ef
printf_uxn_opcodes_h_l71_c3_34ef_uxn_opcodes_h_l71_c3_34ef : entity work.printf_uxn_opcodes_h_l71_c3_34ef_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l71_c3_34ef_uxn_opcodes_h_l71_c3_34ef_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8
BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_left,
BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_right,
BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0
tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- t8_MUX_uxn_opcodes_h_l78_c7_a6e0
t8_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
t8_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0
result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c
BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_left,
BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_right,
BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l83_c7_15e9
tmp16_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- t8_MUX_uxn_opcodes_h_l83_c7_15e9
t8_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
t8_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
t8_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
t8_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l83_c7_15e9
result_pc_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1
BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_left,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_right,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c
tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_cond,
tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue,
tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse,
tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c
result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_cond,
result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue,
result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse,
result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e
BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_left,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_right,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l93_c7_f56c
tmp16_MUX_uxn_opcodes_h_l93_c7_f56c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_cond,
tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue,
tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse,
tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l93_c7_f56c
result_pc_MUX_uxn_opcodes_h_l93_c7_f56c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_cond,
result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue,
result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse,
result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85
BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_left,
BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_right,
BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output);

-- tmp16_MUX_uxn_opcodes_h_l100_c7_fbda
tmp16_MUX_uxn_opcodes_h_l100_c7_fbda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_cond,
tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue,
tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse,
tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_return_output);

-- result_pc_MUX_uxn_opcodes_h_l100_c7_fbda
result_pc_MUX_uxn_opcodes_h_l100_c7_fbda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_cond,
result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue,
result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse,
result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_cond,
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f
BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_left,
BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_right,
BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l104_c7_a403
tmp16_MUX_uxn_opcodes_h_l104_c7_a403 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l104_c7_a403_cond,
tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iftrue,
tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iffalse,
tmp16_MUX_uxn_opcodes_h_l104_c7_a403_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_return_output);

-- result_pc_MUX_uxn_opcodes_h_l104_c7_a403
result_pc_MUX_uxn_opcodes_h_l104_c7_a403 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l104_c7_a403_cond,
result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iftrue,
result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iffalse,
result_pc_MUX_uxn_opcodes_h_l104_c7_a403_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_cond,
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_return_output);

-- CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9
CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_x,
CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_left,
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_right,
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf
BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_left,
BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_right,
BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb
tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_cond,
tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue,
tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse,
tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb
result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_cond,
result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue,
result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse,
result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_left,
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_right,
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318
BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_left,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_right,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output);

-- tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1
tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_cond,
tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue,
tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse,
tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1
result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_cond,
result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue,
result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse,
result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b
BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_left,
BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_right,
BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab
BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_left,
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_right,
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_left,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_right,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_left,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_right,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_return_output);

-- MUX_uxn_opcodes_h_l119_c15_0bd2
MUX_uxn_opcodes_h_l119_c15_0bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l119_c15_0bd2_cond,
MUX_uxn_opcodes_h_l119_c15_0bd2_iftrue,
MUX_uxn_opcodes_h_l119_c15_0bd2_iffalse,
MUX_uxn_opcodes_h_l119_c15_0bd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d
BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_left,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_right,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_return_output,
 tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 t8_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 t8_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output,
 tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 t8_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output,
 result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output,
 tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_return_output,
 result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output,
 tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_return_output,
 result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output,
 tmp16_MUX_uxn_opcodes_h_l104_c7_a403_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_return_output,
 result_pc_MUX_uxn_opcodes_h_l104_c7_a403_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_return_output,
 CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output,
 tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output,
 result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output,
 tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output,
 result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_return_output,
 MUX_uxn_opcodes_h_l119_c15_0bd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_d7d5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l71_c3_34ef_uxn_opcodes_h_l71_c3_34ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_4a53 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l87_c3_6b44 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l83_c7_15e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l91_c3_c6fc : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l95_c3_9069 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l108_c3_4997 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l112_c3_f7f2 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l117_c3_eb22 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_7940_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_1d7e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_d955_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_d8a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_a5a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_d994_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_62ce_uxn_opcodes_h_l126_l65_DUPLICATE_f906_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_4a53 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_4a53;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l87_c3_6b44 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l87_c3_6b44;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_right := to_unsigned(9, 4);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l95_c3_9069 := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l95_c3_9069;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_d7d5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_d7d5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_right := to_unsigned(8, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l91_c3_c6fc := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l91_c3_c6fc;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := to_unsigned(1, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l117_c3_eb22 := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l117_c3_eb22;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l89_c11_00a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l100_c11_df85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_left;
     BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output := BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l121_c11_511d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_left;
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_return_output := BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l104_c11_532f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_left;
     BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output := BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l83_c11_038c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_left;
     BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output := BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l93_c11_bc9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c15_28ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_a5a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_a5a6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l78_c11_59e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l110_c11_cbaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_d8a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_d8a0_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l112_c21_f003] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_left;
     BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_return_output := BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_d994 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_d994_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l108_c21_88b3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l83_c7_15e9_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_7940 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_7940_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l114_c11_9318] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_left;
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output := BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_d955 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_d955_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_1d7e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_1d7e_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l70_c6_71d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l83_c7_15e9_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l119_c25_fc5d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l70_c2_fca1_return_output := result.is_stack_index_flipped;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l83_c7_15e9_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output := result.pc;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_df85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_532f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_cbaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_9318_return_output;
     VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_28ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_511d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_71d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_59e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_038c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_00a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_bc9e_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l108_c3_4997 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_88b3_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l112_c3_f7f2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_f003_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_fc5d_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_d994_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_d994_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_d955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_d955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_d955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_d955_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8159_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_7940_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_7940_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_7940_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_7940_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_7940_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a114_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_f22b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_1d7e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_1d7e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_1d7e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_1d7e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_1d7e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_d8a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_d8a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_d8a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_d8a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_d8a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_a5a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_a5a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_a5a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_a5a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l70_c2_fca1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l108_c3_4997;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l112_c3_f7f2;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_6622] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l93_c7_f56c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;

     -- t8_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     t8_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     t8_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := t8_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l93_c7_f56c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_ca9a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_6622] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l114_c7_fcd1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l93_c7_f56c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l106_c3_f5a9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_return_output := CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l115_c3_8a3b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_left;
     BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_return_output := BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l114_c7_fcd1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_right := VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_8a3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_f5a9_return_output;
     VAR_printf_uxn_opcodes_h_l71_c3_34ef_uxn_opcodes_h_l71_c3_34ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ca9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_6622_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_6622_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- printf_uxn_opcodes_h_l71_c3_34ef[uxn_opcodes_h_l71_c3_34ef] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l71_c3_34ef_uxn_opcodes_h_l71_c3_34ef_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l71_c3_34ef_uxn_opcodes_h_l71_c3_34ef_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l89_c7_0c7c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_c421] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_left;
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_return_output := BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l110_c7_6eeb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_fcd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;

     -- t8_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := t8_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l110_c7_6eeb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l89_c7_0c7c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l114_c7_fcd1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_cond;
     tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output := tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l89_c7_0c7c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_fcd1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c421_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l104_c7_a403] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_return_output := result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l110_c7_6eeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l104_c7_a403] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_94e0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c7_6eeb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l110_c7_6eeb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_cond;
     tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output := tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;

     -- t8_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     t8_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     t8_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := t8_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_94e0_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_a403_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_a403_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l100_c7_fbda] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l104_c7_a403] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l104_c7_a403] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l104_c7_a403_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_cond;
     tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iftrue;
     tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_return_output := tmp16_MUX_uxn_opcodes_h_l104_c7_a403_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l104_c7_a403] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_return_output;

     -- MUX[uxn_opcodes_h_l119_c15_0bd2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l119_c15_0bd2_cond <= VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_cond;
     MUX_uxn_opcodes_h_l119_c15_0bd2_iftrue <= VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_iftrue;
     MUX_uxn_opcodes_h_l119_c15_0bd2_iffalse <= VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_return_output := MUX_uxn_opcodes_h_l119_c15_0bd2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l100_c7_fbda] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_return_output := result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue := VAR_MUX_uxn_opcodes_h_l119_c15_0bd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_a403_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_a403_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_a403_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l100_c7_fbda] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_f56c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l100_c7_fbda] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_cond;
     tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue;
     tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_return_output := tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l114_c7_fcd1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_cond;
     result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output := result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l100_c7_fbda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_f56c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_fcd1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l93_c7_f56c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_cond;
     tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_return_output := tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l89_c7_0c7c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l110_c7_6eeb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_cond;
     result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output := result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_f56c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_f56c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l89_c7_0c7c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_6eeb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l104_c7_a403] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l104_c7_a403_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_cond;
     result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iftrue;
     result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_return_output := result_pc_MUX_uxn_opcodes_h_l104_c7_a403_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l89_c7_0c7c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_cond;
     tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output := tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_0c7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_0c7c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_a403_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l100_c7_fbda] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_cond;
     result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iftrue;
     result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_return_output := result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_fbda_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l93_c7_f56c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_cond;
     result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_return_output := result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_f56c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l89_c7_0c7c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_cond;
     result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output := result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_0c7c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l83_c7_15e9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_cond;
     result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_return_output := result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;

     -- Submodule level 12
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_15e9_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l78_c7_a6e0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_cond;
     result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output := result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;

     -- Submodule level 13
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_a6e0_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l70_c2_fca1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_cond;
     result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_return_output := result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_62ce_uxn_opcodes_h_l126_l65_DUPLICATE_f906 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_62ce_uxn_opcodes_h_l126_l65_DUPLICATE_f906_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_62ce(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fca1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fca1_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_62ce_uxn_opcodes_h_l126_l65_DUPLICATE_f906_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_62ce_uxn_opcodes_h_l126_l65_DUPLICATE_f906_return_output;
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
