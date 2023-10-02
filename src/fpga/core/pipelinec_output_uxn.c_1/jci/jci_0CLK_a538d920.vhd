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
-- BIN_OP_EQ[uxn_opcodes_h_l70_c6_c53d]
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_e9e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l70_c2_13e9]
signal t8_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_13e9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l70_c2_13e9]
signal tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l71_c3_469f[uxn_opcodes_h_l71_c3_469f]
signal printf_uxn_opcodes_h_l71_c3_469f_uxn_opcodes_h_l71_c3_469f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l78_c11_d517]
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l78_c7_64d3]
signal t8_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l78_c7_64d3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l78_c7_64d3]
signal tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l83_c11_6cce]
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal t8_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l83_c7_6a4c]
signal tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l89_c11_9723]
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l89_c7_36bb]
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l89_c7_36bb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l89_c7_36bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l89_c7_36bb]
signal result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l89_c7_36bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_36bb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l89_c7_36bb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_36bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l89_c7_36bb]
signal tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l93_c11_2794]
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_4cbe]
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l93_c7_4cbe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l93_c7_4cbe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l93_c7_4cbe]
signal result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l93_c7_4cbe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_4cbe]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_4cbe]
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_4cbe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l93_c7_4cbe]
signal tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l100_c11_45ca]
signal BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l100_c7_06d9]
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l100_c7_06d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l100_c7_06d9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l100_c7_06d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l100_c7_06d9]
signal result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l100_c7_06d9]
signal tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l104_c11_a85b]
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l104_c7_5f51]
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l104_c7_5f51]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l104_c7_5f51]
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l104_c7_5f51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l104_c7_5f51]
signal result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l104_c7_5f51]
signal tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l106_c3_8c85]
signal CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l108_c21_6c2e]
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l110_c11_35c7]
signal BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l110_c7_7166]
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c7_7166]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l110_c7_7166]
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l110_c7_7166]
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l110_c7_7166]
signal result_pc_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l110_c7_7166]
signal tmp16_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l112_c21_52e0]
signal BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l114_c11_4c9e]
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l114_c7_973f]
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_973f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l114_c7_973f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_973f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l114_c7_973f]
signal result_pc_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l114_c7_973f]
signal tmp16_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l115_c3_f7fb]
signal BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c15_5869]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l119_c25_4ef8]
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_0a8f]
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_4d22]
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l119_c15_755f]
signal MUX_uxn_opcodes_h_l119_c15_755f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l119_c15_755f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l119_c15_755f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l119_c15_755f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l121_c11_96b5]
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_48ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_48ee]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_155d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.ram_addr := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.pc := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_ram_read := ref_toks_10;
      base.is_opc_done := ref_toks_11;
      base.is_stack_read := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d
BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_left,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_right,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_return_output);

-- t8_MUX_uxn_opcodes_h_l70_c2_13e9
t8_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
t8_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
t8_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
t8_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l70_c2_13e9
result_pc_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l70_c2_13e9
tmp16_MUX_uxn_opcodes_h_l70_c2_13e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_cond,
tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

-- printf_uxn_opcodes_h_l71_c3_469f_uxn_opcodes_h_l71_c3_469f
printf_uxn_opcodes_h_l71_c3_469f_uxn_opcodes_h_l71_c3_469f : entity work.printf_uxn_opcodes_h_l71_c3_469f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l71_c3_469f_uxn_opcodes_h_l71_c3_469f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517
BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_left,
BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_right,
BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output);

-- t8_MUX_uxn_opcodes_h_l78_c7_64d3
t8_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
t8_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
t8_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
t8_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l78_c7_64d3
result_pc_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l78_c7_64d3
tmp16_MUX_uxn_opcodes_h_l78_c7_64d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_cond,
tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue,
tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse,
tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce
BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_left,
BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_right,
BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output);

-- t8_MUX_uxn_opcodes_h_l83_c7_6a4c
t8_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
t8_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c
result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c
tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_cond,
tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723
BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_left,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_right,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l89_c7_36bb
result_pc_MUX_uxn_opcodes_h_l89_c7_36bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_cond,
result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue,
result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse,
result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l89_c7_36bb
tmp16_MUX_uxn_opcodes_h_l89_c7_36bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_cond,
tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794
BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_left,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_right,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_cond,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output);

-- result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe
result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_cond,
result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue,
result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse,
result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe
tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_cond,
tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue,
tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse,
tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca
BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_left,
BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_right,
BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l100_c7_06d9
result_pc_MUX_uxn_opcodes_h_l100_c7_06d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_cond,
result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue,
result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse,
result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l100_c7_06d9
tmp16_MUX_uxn_opcodes_h_l100_c7_06d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_cond,
tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b
BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_left,
BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_right,
BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_cond,
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_return_output);

-- result_pc_MUX_uxn_opcodes_h_l104_c7_5f51
result_pc_MUX_uxn_opcodes_h_l104_c7_5f51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_cond,
result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue,
result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse,
result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_return_output);

-- tmp16_MUX_uxn_opcodes_h_l104_c7_5f51
tmp16_MUX_uxn_opcodes_h_l104_c7_5f51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_cond,
tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue,
tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse,
tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_return_output);

-- CONST_SL_8_uxn_opcodes_h_l106_c3_8c85
CONST_SL_8_uxn_opcodes_h_l106_c3_8c85 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_x,
CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_left,
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_right,
BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7
BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_left,
BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_right,
BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_cond,
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_return_output);

-- result_pc_MUX_uxn_opcodes_h_l110_c7_7166
result_pc_MUX_uxn_opcodes_h_l110_c7_7166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l110_c7_7166_cond,
result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iftrue,
result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iffalse,
result_pc_MUX_uxn_opcodes_h_l110_c7_7166_return_output);

-- tmp16_MUX_uxn_opcodes_h_l110_c7_7166
tmp16_MUX_uxn_opcodes_h_l110_c7_7166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l110_c7_7166_cond,
tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iftrue,
tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iffalse,
tmp16_MUX_uxn_opcodes_h_l110_c7_7166_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_left,
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_right,
BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e
BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_left,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_right,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l114_c7_973f
result_pc_MUX_uxn_opcodes_h_l114_c7_973f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l114_c7_973f_cond,
result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iftrue,
result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iffalse,
result_pc_MUX_uxn_opcodes_h_l114_c7_973f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l114_c7_973f
tmp16_MUX_uxn_opcodes_h_l114_c7_973f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l114_c7_973f_cond,
tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iftrue,
tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iffalse,
tmp16_MUX_uxn_opcodes_h_l114_c7_973f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb
BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_left,
BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_right,
BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869
BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_left,
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_right,
BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_left,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_right,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_left,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_right,
BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_return_output);

-- MUX_uxn_opcodes_h_l119_c15_755f
MUX_uxn_opcodes_h_l119_c15_755f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l119_c15_755f_cond,
MUX_uxn_opcodes_h_l119_c15_755f_iftrue,
MUX_uxn_opcodes_h_l119_c15_755f_iffalse,
MUX_uxn_opcodes_h_l119_c15_755f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5
BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_left,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_right,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_return_output,
 t8_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output,
 t8_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output,
 t8_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output,
 result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output,
 result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output,
 tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_return_output,
 result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_return_output,
 result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_return_output,
 tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_return_output,
 CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_return_output,
 result_pc_MUX_uxn_opcodes_h_l110_c7_7166_return_output,
 tmp16_MUX_uxn_opcodes_h_l110_c7_7166_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_return_output,
 result_pc_MUX_uxn_opcodes_h_l114_c7_973f_return_output,
 tmp16_MUX_uxn_opcodes_h_l114_c7_973f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_return_output,
 MUX_uxn_opcodes_h_l119_c15_755f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_e2de : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l71_c3_469f_uxn_opcodes_h_l71_c3_469f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_efd7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l87_c3_4fa6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l83_c7_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l91_c3_5dfd : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l95_c3_30b5 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l108_c3_e6a5 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l112_c3_8935 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l117_c3_04e8 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_755f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_755f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_755f_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l119_c15_755f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_9863_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_be12_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_ad26_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_dd30_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_f7cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_5e69_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_155d_uxn_opcodes_h_l126_l65_DUPLICATE_f34e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l91_c3_5dfd := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l91_c3_5dfd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_efd7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_efd7;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l87_c3_4fa6 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l87_c3_4fa6;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_e2de := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_e2de;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_right := to_unsigned(2, 2);
     VAR_result_ram_addr_uxn_opcodes_h_l117_c3_04e8 := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l117_c3_04e8;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_right := to_unsigned(8, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l95_c3_30b5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l95_c3_30b5;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_be12 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_be12_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l119_c25_4ef8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_dd30 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_dd30_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l93_c11_2794] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_left;
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output := BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_f7cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_f7cf_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l110_c11_35c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l83_c7_6a4c_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l78_c11_d517] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_left;
     BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output := BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l70_c6_c53d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_left;
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output := BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l121_c11_96b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l104_c11_a85b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_left;
     BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output := BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l83_c11_6cce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_left;
     BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output := BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l114_c11_4c9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l89_c11_9723] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_left;
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output := BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l108_c21_6c2e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output := result.pc;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_ad26 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_ad26_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_5e69 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_5e69_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c15_5869] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l112_c21_52e0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l83_c7_6a4c_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l70_c2_13e9_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l83_c7_6a4c_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_9863 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_9863_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l100_c11_45ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c11_45ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_a85b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c11_35c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_4c9e_return_output;
     VAR_MUX_uxn_opcodes_h_l119_c15_755f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c15_5869_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_96b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_c53d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_d517_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_6cce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_9723_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_2794_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l108_c3_e6a5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l108_c21_6c2e_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l112_c3_8935 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l112_c21_52e0_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l119_c15_755f_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c25_4ef8_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_5e69_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l105_l115_DUPLICATE_5e69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_ad26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_ad26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_ad26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_ad26_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l89_l83_l114_l78_l110_l70_l104_l100_DUPLICATE_8ad8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_9863_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_9863_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_9863_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_9863_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_9863_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l89_l121_l83_l114_l78_l110_l104_l100_DUPLICATE_a160_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l89_l121_l83_l78_l110_l70_l104_l100_DUPLICATE_5316_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_f7cf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_f7cf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_f7cf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_f7cf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l89_l83_l114_l78_l70_DUPLICATE_f7cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_be12_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_be12_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_be12_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_be12_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l93_l89_l83_l78_l70_DUPLICATE_be12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_dd30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_dd30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_dd30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l78_l93_l83_l70_DUPLICATE_dd30_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l70_c2_13e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l108_c3_e6a5;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l112_c3_8935;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l93_c7_4cbe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- t8_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := t8_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_e9e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l114_c7_973f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l106_c3_8c85] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_x <= VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_return_output := CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l115_c3_f7fb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_left;
     BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_return_output := BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_48ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l93_c7_4cbe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l114_c7_973f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_48ee] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l93_c7_4cbe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l115_c3_f7fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l106_c3_8c85_return_output;
     VAR_printf_uxn_opcodes_h_l71_c3_469f_uxn_opcodes_h_l71_c3_469f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_e9e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_48ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_48ee_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l114_c7_973f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_973f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l89_c7_36bb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l89_c7_36bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l110_c7_7166] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_return_output := result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_973f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l114_c7_973f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l114_c7_973f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_cond;
     tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_return_output := tmp16_MUX_uxn_opcodes_h_l114_c7_973f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- t8_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     t8_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     t8_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := t8_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l89_c7_36bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_973f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l110_c7_7166] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_return_output;

     -- printf_uxn_opcodes_h_l71_c3_469f[uxn_opcodes_h_l71_c3_469f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l71_c3_469f_uxn_opcodes_h_l71_c3_469f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l71_c3_469f_uxn_opcodes_h_l71_c3_469f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_0a8f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_0a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_973f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_973f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l110_c7_7166_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l110_c7_7166_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_973f_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l119_c35_4d22] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_left;
     BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_return_output := BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l110_c7_7166] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l104_c7_5f51] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_return_output := result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l104_c7_5f51] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;

     -- t8_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     t8_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     t8_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := t8_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l110_c7_7166] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l110_c7_7166_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_cond;
     tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iftrue;
     tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_return_output := tmp16_MUX_uxn_opcodes_h_l110_c7_7166_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c7_7166] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l119_c15_755f_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l119_c35_4d22_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c7_7166_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c7_7166_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l110_c7_7166_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- MUX[uxn_opcodes_h_l119_c15_755f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l119_c15_755f_cond <= VAR_MUX_uxn_opcodes_h_l119_c15_755f_cond;
     MUX_uxn_opcodes_h_l119_c15_755f_iftrue <= VAR_MUX_uxn_opcodes_h_l119_c15_755f_iftrue;
     MUX_uxn_opcodes_h_l119_c15_755f_iffalse <= VAR_MUX_uxn_opcodes_h_l119_c15_755f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l119_c15_755f_return_output := MUX_uxn_opcodes_h_l119_c15_755f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l104_c7_5f51] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_cond;
     tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue;
     tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_return_output := tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l100_c7_06d9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l104_c7_5f51] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l104_c7_5f51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l100_c7_06d9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iftrue := VAR_MUX_uxn_opcodes_h_l119_c15_755f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_4cbe] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l100_c7_06d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_cond;
     tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_return_output := tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l100_c7_06d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_4cbe] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output := result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l114_c7_973f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l114_c7_973f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_cond;
     result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_return_output := result_pc_MUX_uxn_opcodes_h_l114_c7_973f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l100_c7_06d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_973f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_4cbe] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l89_c7_36bb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_4cbe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l93_c7_4cbe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_cond;
     tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output := tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l89_c7_36bb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l110_c7_7166] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l110_c7_7166_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_cond;
     result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iftrue;
     result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_return_output := result_pc_MUX_uxn_opcodes_h_l110_c7_7166_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l110_c7_7166_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_36bb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_36bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l89_c7_36bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_cond;
     tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_return_output := tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l104_c7_5f51] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_cond;
     result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iftrue;
     result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_return_output := result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l104_c7_5f51_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l100_c7_06d9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_cond;
     result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_return_output := result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l100_c7_06d9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l93_c7_4cbe] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_cond;
     result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iftrue;
     result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output := result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_4cbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l89_c7_36bb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_cond;
     result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_return_output := result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_36bb_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l83_c7_6a4c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_cond;
     result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output := result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;

     -- Submodule level 12
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l83_c7_6a4c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l78_c7_64d3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_cond;
     result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_return_output := result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;

     -- Submodule level 13
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_64d3_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l70_c2_13e9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_cond;
     result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_return_output := result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_155d_uxn_opcodes_h_l126_l65_DUPLICATE_f34e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_155d_uxn_opcodes_h_l126_l65_DUPLICATE_f34e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_155d(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_13e9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_13e9_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_155d_uxn_opcodes_h_l126_l65_DUPLICATE_f34e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_155d_uxn_opcodes_h_l126_l65_DUPLICATE_f34e_return_output;
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
