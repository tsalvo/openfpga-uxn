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
-- BIN_OP_EQ[uxn_opcodes_h_l70_c6_0237]
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_426c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l70_c2_541a]
signal t8_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l70_c2_541a]
signal tmp16_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_pc_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_541a]
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l71_c3_da57[uxn_opcodes_h_l71_c3_da57]
signal printf_uxn_opcodes_h_l71_c3_da57_uxn_opcodes_h_l71_c3_da57_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l78_c11_c988]
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l78_c7_d501]
signal t8_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l78_c7_d501]
signal tmp16_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_pc_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l78_c7_d501]
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l83_c11_4c4f]
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l83_c7_257c]
signal t8_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l83_c7_257c]
signal tmp16_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_pc_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l83_c7_257c]
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l89_c11_7681]
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l89_c7_a146]
signal tmp16_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_a146]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l89_c7_a146]
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_a146]
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l89_c7_a146]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l89_c7_a146]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l89_c7_a146]
signal result_pc_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l89_c7_a146]
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l89_c7_a146]
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l93_c11_eae0]
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l93_c7_9ea2]
signal tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_9ea2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_9ea2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_9ea2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l93_c7_9ea2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l93_c7_9ea2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l93_c7_9ea2]
signal result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l93_c7_9ea2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_9ea2]
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l100_c11_3314]
signal BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l100_c7_046c]
signal tmp16_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l100_c7_046c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l100_c7_046c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l100_c7_046c]
signal result_pc_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l100_c7_046c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l100_c7_046c]
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l104_c11_ee81]
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l104_c7_00a9]
signal tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l104_c7_00a9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l104_c7_00a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l104_c7_00a9]
signal result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l104_c7_00a9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l104_c7_00a9]
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l106_c3_0a46]
signal CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l108_c21_b04a]
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l110_c11_e930]
signal BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l110_c7_03b9]
signal tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c7_03b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l110_c7_03b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l110_c7_03b9]
signal result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l110_c7_03b9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l110_c7_03b9]
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l112_c21_3fc5]
signal BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l114_c11_4ade]
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l114_c7_75d0]
signal tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_75d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_75d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l114_c7_75d0]
signal result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l114_c7_75d0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l114_c7_75d0]
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l115_c3_d0a6]
signal BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c15_398e]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l119_c25_6fd3]
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_c2c5]
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_6afd]
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l119_c15_0296]
signal MUX_uxn_opcodes_h_l119_c15_0296_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l119_c15_0296_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l119_c15_0296_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l119_c15_0296_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l121_c11_3008]
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_fd2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_fd2e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_77a8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_ram_read := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.pc := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;
      base.is_stack_index_flipped := ref_toks_11;
      base.ram_addr := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237
BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_left,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_right,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_return_output);

-- t8_MUX_uxn_opcodes_h_l70_c2_541a
t8_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l70_c2_541a_cond,
t8_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
t8_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
t8_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l70_c2_541a
tmp16_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l70_c2_541a_cond,
tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
tmp16_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l70_c2_541a
result_pc_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_pc_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

-- printf_uxn_opcodes_h_l71_c3_da57_uxn_opcodes_h_l71_c3_da57
printf_uxn_opcodes_h_l71_c3_da57_uxn_opcodes_h_l71_c3_da57 : entity work.printf_uxn_opcodes_h_l71_c3_da57_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l71_c3_da57_uxn_opcodes_h_l71_c3_da57_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988
BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_left,
BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_right,
BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output);

-- t8_MUX_uxn_opcodes_h_l78_c7_d501
t8_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l78_c7_d501_cond,
t8_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
t8_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
t8_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- tmp16_MUX_uxn_opcodes_h_l78_c7_d501
tmp16_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l78_c7_d501_cond,
tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
tmp16_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_pc_MUX_uxn_opcodes_h_l78_c7_d501
result_pc_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_pc_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_cond,
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f
BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_left,
BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_right,
BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output);

-- t8_MUX_uxn_opcodes_h_l83_c7_257c
t8_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l83_c7_257c_cond,
t8_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
t8_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
t8_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l83_c7_257c
tmp16_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l83_c7_257c_cond,
tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
tmp16_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l83_c7_257c
result_pc_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_pc_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681
BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_left,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_right,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output);

-- tmp16_MUX_uxn_opcodes_h_l89_c7_a146
tmp16_MUX_uxn_opcodes_h_l89_c7_a146 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l89_c7_a146_cond,
tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iftrue,
tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iffalse,
tmp16_MUX_uxn_opcodes_h_l89_c7_a146_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output);

-- result_pc_MUX_uxn_opcodes_h_l89_c7_a146
result_pc_MUX_uxn_opcodes_h_l89_c7_a146 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l89_c7_a146_cond,
result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iftrue,
result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iffalse,
result_pc_MUX_uxn_opcodes_h_l89_c7_a146_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_cond,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0
BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_left,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_right,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2
tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_cond,
tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue,
tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse,
tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2
result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_cond,
result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue,
result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse,
result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314
BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_left,
BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_right,
BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output);

-- tmp16_MUX_uxn_opcodes_h_l100_c7_046c
tmp16_MUX_uxn_opcodes_h_l100_c7_046c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l100_c7_046c_cond,
tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iftrue,
tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iffalse,
tmp16_MUX_uxn_opcodes_h_l100_c7_046c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l100_c7_046c
result_pc_MUX_uxn_opcodes_h_l100_c7_046c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l100_c7_046c_cond,
result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iftrue,
result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iffalse,
result_pc_MUX_uxn_opcodes_h_l100_c7_046c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81
BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_left,
BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_right,
BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output);

-- tmp16_MUX_uxn_opcodes_h_l104_c7_00a9
tmp16_MUX_uxn_opcodes_h_l104_c7_00a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_cond,
tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue,
tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse,
tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l104_c7_00a9
result_pc_MUX_uxn_opcodes_h_l104_c7_00a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_cond,
result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue,
result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse,
result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_return_output);

-- CONST_SL_8_uxn_opcodes_h_l106_c3_0a46
CONST_SL_8_uxn_opcodes_h_l106_c3_0a46 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_x,
CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_left,
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_right,
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930
BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_left,
BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_right,
BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output);

-- tmp16_MUX_uxn_opcodes_h_l110_c7_03b9
tmp16_MUX_uxn_opcodes_h_l110_c7_03b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_cond,
tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l110_c7_03b9
result_pc_MUX_uxn_opcodes_h_l110_c7_03b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_cond,
result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue,
result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse,
result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_left,
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_right,
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade
BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_left,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_right,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output);

-- tmp16_MUX_uxn_opcodes_h_l114_c7_75d0
tmp16_MUX_uxn_opcodes_h_l114_c7_75d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_cond,
tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l114_c7_75d0
result_pc_MUX_uxn_opcodes_h_l114_c7_75d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_cond,
result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue,
result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse,
result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6
BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_left,
BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_right,
BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e
BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_left,
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_right,
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_left,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_right,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_left,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_right,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_return_output);

-- MUX_uxn_opcodes_h_l119_c15_0296
MUX_uxn_opcodes_h_l119_c15_0296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l119_c15_0296_cond,
MUX_uxn_opcodes_h_l119_c15_0296_iftrue,
MUX_uxn_opcodes_h_l119_c15_0296_iffalse,
MUX_uxn_opcodes_h_l119_c15_0296_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008
BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_left,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_right,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_return_output,
 t8_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 tmp16_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_pc_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output,
 t8_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 tmp16_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_pc_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output,
 t8_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 tmp16_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_pc_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output,
 tmp16_MUX_uxn_opcodes_h_l89_c7_a146_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output,
 result_pc_MUX_uxn_opcodes_h_l89_c7_a146_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output,
 tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output,
 result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output,
 tmp16_MUX_uxn_opcodes_h_l100_c7_046c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_return_output,
 result_pc_MUX_uxn_opcodes_h_l100_c7_046c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output,
 tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_return_output,
 result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_return_output,
 CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output,
 tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_return_output,
 result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output,
 tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_return_output,
 result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_return_output,
 MUX_uxn_opcodes_h_l119_c15_0296_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_cc0d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l71_c3_da57_uxn_opcodes_h_l71_c3_da57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_90e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l87_c3_afdc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l83_c7_257c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l91_c3_b5b8 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l95_c3_ac34 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l108_c3_f597 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l112_c3_00ca : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l117_c3_358c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_0296_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_0296_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_0296_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_0296_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_6429_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_16fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_7ffd_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l89_l83_l78_l70_l93_DUPLICATE_6e6b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_5daf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_6a3c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77a8_uxn_opcodes_h_l126_l65_DUPLICATE_32e6_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_cc0d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_cc0d;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l95_c3_ac34 := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l95_c3_ac34;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l91_c3_b5b8 := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l91_c3_b5b8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue := to_unsigned(1, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l117_c3_358c := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l117_c3_358c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l87_c3_afdc := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l87_c3_afdc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_90e4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_90e4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l93_c11_eae0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_left;
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output := BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l112_c21_3fc5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l89_l83_l78_l70_l93_DUPLICATE_6e6b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l89_l83_l78_l70_l93_DUPLICATE_6e6b_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l110_c11_e930] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_left;
     BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output := BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l89_c11_7681] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_left;
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output := BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l114_c11_4ade] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_left;
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output := BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_7ffd LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_7ffd_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_16fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_16fc_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l78_c11_c988] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_left;
     BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output := BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l104_c11_ee81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_left;
     BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output := BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l70_c6_0237] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_left;
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output := BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l83_c7_257c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_6429 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_6429_return_output := result.is_ram_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_6a3c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_6a3c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_5daf LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_5daf_return_output := result.ram_addr;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l83_c7_257c_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l108_c21_b04a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l83_c7_257c_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l70_c2_541a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l119_c25_6fd3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l121_c11_3008] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_left;
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_return_output := BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c15_398e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l83_c11_4c4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l100_c11_3314] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_left;
     BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output := BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_3314_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_ee81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_e930_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4ade_return_output;
     VAR_MUX_uxn_opcodes_h_l119_c15_0296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_398e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_3008_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_0237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_c988_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_4c4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_eae0_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l108_c3_f597 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_b04a_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l112_c3_00ca := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_3fc5_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l119_c15_0296_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_6fd3_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_6a3c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_6a3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_7ffd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_7ffd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_7ffd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_7ffd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l89_l83_l114_l78_l110_l70_l104_l100_l93_DUPLICATE_0ef7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_5daf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_5daf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_5daf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_5daf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_5daf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l89_l121_l83_l114_l78_l110_l104_l100_l93_DUPLICATE_919a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l89_l121_l83_l78_l110_l70_l104_l100_l93_DUPLICATE_6ad2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_6429_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_6429_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_6429_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_6429_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_6429_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l89_l83_l78_l70_l93_DUPLICATE_6e6b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l89_l83_l78_l70_l93_DUPLICATE_6e6b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l89_l83_l78_l70_l93_DUPLICATE_6e6b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l89_l83_l78_l70_l93_DUPLICATE_6e6b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l89_l83_l78_l70_l93_DUPLICATE_6e6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_16fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_16fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_16fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l78_l93_l83_DUPLICATE_16fc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l70_c2_541a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l108_c3_f597;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l112_c3_00ca;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l93_c7_9ea2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l114_c7_75d0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l106_c3_0a46] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_x <= VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_return_output := CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_return_output;

     -- t8_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     t8_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     t8_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_return_output := t8_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l115_c3_d0a6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_left;
     BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_return_output := BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_426c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_fd2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l93_c7_9ea2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l93_c7_9ea2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l114_c7_75d0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_fd2e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_right := VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_d0a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_0a46_return_output;
     VAR_printf_uxn_opcodes_h_l71_c3_da57_uxn_opcodes_h_l71_c3_da57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_426c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_fd2e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_t8_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l89_c7_a146] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output;

     -- t8_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     t8_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     t8_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_return_output := t8_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l89_c7_a146] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output;

     -- printf_uxn_opcodes_h_l71_c3_da57[uxn_opcodes_h_l71_c3_da57] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l71_c3_da57_uxn_opcodes_h_l71_c3_da57_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l71_c3_da57_uxn_opcodes_h_l71_c3_da57_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l110_c7_03b9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_c2c5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_75d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l110_c7_03b9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l89_c7_a146] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_75d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l114_c7_75d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_cond;
     tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_return_output := tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_c2c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_a146_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_a146_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c7_03b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_6afd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- t8_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     t8_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     t8_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_return_output := t8_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l104_c7_00a9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l110_c7_03b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l110_c7_03b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_cond;
     tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_return_output := tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l104_c7_00a9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l119_c15_0296_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_6afd_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l70_c2_541a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l100_c7_046c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l104_c7_00a9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;

     -- MUX[uxn_opcodes_h_l119_c15_0296] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l119_c15_0296_cond <= VAR_MUX_uxn_opcodes_h_l119_c15_0296_cond;
     MUX_uxn_opcodes_h_l119_c15_0296_iftrue <= VAR_MUX_uxn_opcodes_h_l119_c15_0296_iftrue;
     MUX_uxn_opcodes_h_l119_c15_0296_iffalse <= VAR_MUX_uxn_opcodes_h_l119_c15_0296_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l119_c15_0296_return_output := MUX_uxn_opcodes_h_l119_c15_0296_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l100_c7_046c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l104_c7_00a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l104_c7_00a9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_cond;
     tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_return_output := tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue := VAR_MUX_uxn_opcodes_h_l119_c15_0296_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_046c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_046c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l100_c7_046c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_9ea2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l100_c7_046c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l100_c7_046c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l100_c7_046c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_cond;
     tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_return_output := tmp16_MUX_uxn_opcodes_h_l100_c7_046c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_9ea2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l114_c7_75d0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_cond;
     result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_return_output := result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_046c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_046c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_75d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_046c_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l89_c7_a146] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l89_c7_a146] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_return_output := result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l93_c7_9ea2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_cond;
     tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output := tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_9ea2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_9ea2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l110_c7_03b9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_cond;
     result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_return_output := result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_a146_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_03b9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_a146_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_a146] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l104_c7_00a9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_cond;
     result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_return_output := result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l89_c7_a146] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l89_c7_a146_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_cond;
     tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iftrue;
     tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_return_output := tmp16_MUX_uxn_opcodes_h_l89_c7_a146_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_a146] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_a146_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_a146_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_00a9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_a146_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l100_c7_046c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l100_c7_046c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_cond;
     result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_return_output := result_pc_MUX_uxn_opcodes_h_l100_c7_046c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_return_output := tmp16_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_046c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l93_c7_9ea2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_cond;
     result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output := result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_return_output := tmp16_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_9ea2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l89_c7_a146] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l89_c7_a146_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_cond;
     result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iftrue;
     result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_return_output := result_pc_MUX_uxn_opcodes_h_l89_c7_a146_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_return_output := tmp16_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_a146_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_541a_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l83_c7_257c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l83_c7_257c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_cond;
     result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_return_output := result_pc_MUX_uxn_opcodes_h_l83_c7_257c_return_output;

     -- Submodule level 12
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_257c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l78_c7_d501] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l78_c7_d501_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_cond;
     result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iftrue;
     result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_return_output := result_pc_MUX_uxn_opcodes_h_l78_c7_d501_return_output;

     -- Submodule level 13
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_d501_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l70_c2_541a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l70_c2_541a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_cond;
     result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_return_output := result_pc_MUX_uxn_opcodes_h_l70_c2_541a_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_77a8_uxn_opcodes_h_l126_l65_DUPLICATE_32e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77a8_uxn_opcodes_h_l126_l65_DUPLICATE_32e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_77a8(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_541a_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_541a_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77a8_uxn_opcodes_h_l126_l65_DUPLICATE_32e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77a8_uxn_opcodes_h_l126_l65_DUPLICATE_32e6_return_output;
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
