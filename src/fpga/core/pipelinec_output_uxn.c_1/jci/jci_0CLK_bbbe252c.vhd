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
-- Submodules: 86
entity jci_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_bbbe252c;
architecture arch of jci_0CLK_bbbe252c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l70_c6_6528]
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_4080]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal t8_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l70_c2_e6fa]
signal tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l71_c3_2966[uxn_opcodes_h_l71_c3_2966]
signal printf_uxn_opcodes_h_l71_c3_2966_uxn_opcodes_h_l71_c3_2966_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_4d94]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_5d05]
signal t8_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_5d05]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_5d05]
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_5d05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_5d05]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_5d05]
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_5d05]
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_5d05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l76_c7_5d05]
signal result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_5d05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_5d05]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l79_c11_1cea]
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal t8_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l79_c7_2e8b]
signal tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_805f]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l85_c7_f2fb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_f2fb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l85_c7_f2fb]
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_f2fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l85_c7_f2fb]
signal result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_f2fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_f2fb]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_8719]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l90_c7_a941]
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_a941]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l90_c7_a941]
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l90_c7_a941]
signal result_pc_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_a941]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_a941]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l93_c11_f859]
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_005c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_005c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_005c]
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l93_c7_005c]
signal result_pc_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_005c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l93_c7_005c]
signal tmp16_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l95_c3_897e]
signal CONST_SL_8_uxn_opcodes_h_l95_c3_897e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l95_c3_897e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l96_c21_5443]
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l98_c11_408d]
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l98_c7_9051]
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l98_c7_9051]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l98_c7_9051]
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l98_c7_9051]
signal result_pc_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l98_c7_9051]
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l98_c7_9051]
signal tmp16_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c21_1765]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l101_c11_84db]
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l101_c7_6f06]
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_6f06]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l101_c7_6f06]
signal result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_6f06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l101_c7_6f06]
signal tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l102_c3_ad13]
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l105_c15_cfed]
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c25_1a87]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_85b5]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_05df]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l105_c15_e740]
signal MUX_uxn_opcodes_h_l105_c15_e740_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_e740_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_e740_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_e740_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l107_c11_be7c]
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l107_c7_877b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l107_c7_877b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d6ac( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.ram_addr := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.is_ram_read := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.pc := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528
BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_left,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_right,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_return_output);

-- t8_MUX_uxn_opcodes_h_l70_c2_e6fa
t8_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
t8_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa
result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa
tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_cond,
tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue,
tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse,
tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

-- printf_uxn_opcodes_h_l71_c3_2966_uxn_opcodes_h_l71_c3_2966
printf_uxn_opcodes_h_l71_c3_2966_uxn_opcodes_h_l71_c3_2966 : entity work.printf_uxn_opcodes_h_l71_c3_2966_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l71_c3_2966_uxn_opcodes_h_l71_c3_2966_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94
BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_5d05
t8_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
t8_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- result_pc_MUX_uxn_opcodes_h_l76_c7_5d05
result_pc_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_5d05
tmp16_MUX_uxn_opcodes_h_l76_c7_5d05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea
BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_left,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_right,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output);

-- t8_MUX_uxn_opcodes_h_l79_c7_2e8b
t8_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
t8_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b
result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b
tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_cond,
tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue,
tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse,
tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f
BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb
result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_cond,
result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue,
result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse,
result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb
tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719
BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_cond,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_return_output);

-- result_pc_MUX_uxn_opcodes_h_l90_c7_a941
result_pc_MUX_uxn_opcodes_h_l90_c7_a941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l90_c7_a941_cond,
result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iftrue,
result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iffalse,
result_pc_MUX_uxn_opcodes_h_l90_c7_a941_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_a941
tmp16_MUX_uxn_opcodes_h_l90_c7_a941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_a941_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_a941_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859
BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_left,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_right,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l93_c7_005c
result_pc_MUX_uxn_opcodes_h_l93_c7_005c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l93_c7_005c_cond,
result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iftrue,
result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iffalse,
result_pc_MUX_uxn_opcodes_h_l93_c7_005c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l93_c7_005c
tmp16_MUX_uxn_opcodes_h_l93_c7_005c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l93_c7_005c_cond,
tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iftrue,
tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iffalse,
tmp16_MUX_uxn_opcodes_h_l93_c7_005c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l95_c3_897e
CONST_SL_8_uxn_opcodes_h_l95_c3_897e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l95_c3_897e_x,
CONST_SL_8_uxn_opcodes_h_l95_c3_897e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_left,
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_right,
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d
BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_left,
BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_right,
BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_cond,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_return_output);

-- result_pc_MUX_uxn_opcodes_h_l98_c7_9051
result_pc_MUX_uxn_opcodes_h_l98_c7_9051 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l98_c7_9051_cond,
result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iftrue,
result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iffalse,
result_pc_MUX_uxn_opcodes_h_l98_c7_9051_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_return_output);

-- tmp16_MUX_uxn_opcodes_h_l98_c7_9051
tmp16_MUX_uxn_opcodes_h_l98_c7_9051 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l98_c7_9051_cond,
tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iftrue,
tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iffalse,
tmp16_MUX_uxn_opcodes_h_l98_c7_9051_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db
BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_left,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_right,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_return_output);

-- result_pc_MUX_uxn_opcodes_h_l101_c7_6f06
result_pc_MUX_uxn_opcodes_h_l101_c7_6f06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_cond,
result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue,
result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse,
result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_return_output);

-- tmp16_MUX_uxn_opcodes_h_l101_c7_6f06
tmp16_MUX_uxn_opcodes_h_l101_c7_6f06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_cond,
tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue,
tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse,
tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13
BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_left,
BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_right,
BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed
BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_left,
BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_right,
BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_return_output);

-- MUX_uxn_opcodes_h_l105_c15_e740
MUX_uxn_opcodes_h_l105_c15_e740 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l105_c15_e740_cond,
MUX_uxn_opcodes_h_l105_c15_e740_iftrue,
MUX_uxn_opcodes_h_l105_c15_e740_iffalse,
MUX_uxn_opcodes_h_l105_c15_e740_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c
BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_left,
BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_right,
BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_return_output,
 t8_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output,
 t8_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output,
 result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_return_output,
 result_pc_MUX_uxn_opcodes_h_l90_c7_a941_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_a941_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_return_output,
 result_pc_MUX_uxn_opcodes_h_l93_c7_005c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_return_output,
 tmp16_MUX_uxn_opcodes_h_l93_c7_005c_return_output,
 CONST_SL_8_uxn_opcodes_h_l95_c3_897e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_return_output,
 result_pc_MUX_uxn_opcodes_h_l98_c7_9051_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_return_output,
 tmp16_MUX_uxn_opcodes_h_l98_c7_9051_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_return_output,
 result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_return_output,
 tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_return_output,
 BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_return_output,
 MUX_uxn_opcodes_h_l105_c15_e740_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_9305 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l71_c3_2966_uxn_opcodes_h_l71_c3_2966_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_dee3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_5d05_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_11e1 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l96_c3_65f5 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_897e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_897e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l99_c3_ea06 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_e740_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_e740_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_e740_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_e740_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_6df0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_78b4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_650f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_8fe4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_bc22_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d6ac_uxn_opcodes_h_l65_l112_DUPLICATE_9f23_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_9305 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_9305;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_11e1 := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_11e1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_right := to_unsigned(6, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_dee3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_dee3;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iftrue := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_6df0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_6df0_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l70_c6_6528] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_left;
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output := BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c21_1765] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_650f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_650f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l105_c15_cfed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_left;
     BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_return_output := BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l96_c21_5443] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_left;
     BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_return_output := BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l93_c11_f859] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_left;
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output := BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_5d05_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_8fe4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_8fe4_return_output := result.is_stack_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c25_1a87] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_78b4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_78b4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l107_c11_be7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l98_c11_408d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_left;
     BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output := BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_8719] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_bc22 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_bc22_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l101_c11_84db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_left;
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output := BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_805f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l79_c11_1cea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_left;
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output := BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_4d94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_84db_return_output;
     VAR_MUX_uxn_opcodes_h_l105_c15_e740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_cfed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_be7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_6528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_4d94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_1cea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_805f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8719_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_f859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_408d_return_output;
     VAR_MUX_uxn_opcodes_h_l105_c15_e740_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_1a87_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l96_c3_65f5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_5443_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l99_c3_ea06 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1765_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_bc22_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_897e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_bc22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_650f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_650f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_650f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_4d71_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_6df0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_6df0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_6df0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_6df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_2c89_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_4802_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_e548_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_78b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_78b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_78b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_8fe4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_8fe4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l96_c3_65f5;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l99_c3_ea06;
     -- result_ram_addr_MUX[uxn_opcodes_h_l98_c7_9051] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_return_output := result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_f2fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l101_c7_6f06] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l107_c7_877b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l95_c3_897e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l95_c3_897e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_897e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_897e_return_output := CONST_SL_8_uxn_opcodes_h_l95_c3_897e_return_output;

     -- t8_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := t8_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l102_c3_ad13] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_left;
     BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_return_output := BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l107_c7_877b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_4080] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_right := VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_ad13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_897e_return_output;
     VAR_printf_uxn_opcodes_h_l71_c3_2966_uxn_opcodes_h_l71_c3_2966_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_4080_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_877b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_877b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_9051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_t8_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_005c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_return_output;

     -- t8_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := t8_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_85b5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_6f06] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_6f06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l98_c7_9051] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_return_output;

     -- printf_uxn_opcodes_h_l71_c3_2966[uxn_opcodes_h_l71_c3_2966] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l71_c3_2966_uxn_opcodes_h_l71_c3_2966_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l71_c3_2966_uxn_opcodes_h_l71_c3_2966_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l101_c7_6f06] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_cond;
     tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue;
     tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_return_output := tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_85b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_9051_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_005c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l90_c7_a941] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_return_output := result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_05df] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l98_c7_9051] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l98_c7_9051] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_005c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_return_output;

     -- t8_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := t8_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l98_c7_9051] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l98_c7_9051_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_cond;
     tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iftrue;
     tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_return_output := tmp16_MUX_uxn_opcodes_h_l98_c7_9051_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l105_c15_e740_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_05df_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_9051_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_9051_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_005c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_a941_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_9051_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l85_c7_f2fb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;

     -- MUX[uxn_opcodes_h_l105_c15_e740] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l105_c15_e740_cond <= VAR_MUX_uxn_opcodes_h_l105_c15_e740_cond;
     MUX_uxn_opcodes_h_l105_c15_e740_iftrue <= VAR_MUX_uxn_opcodes_h_l105_c15_e740_iftrue;
     MUX_uxn_opcodes_h_l105_c15_e740_iffalse <= VAR_MUX_uxn_opcodes_h_l105_c15_e740_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l105_c15_e740_return_output := MUX_uxn_opcodes_h_l105_c15_e740_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l93_c7_005c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l93_c7_005c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_cond;
     tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_return_output := tmp16_MUX_uxn_opcodes_h_l93_c7_005c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l90_c7_a941] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_005c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_005c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue := VAR_MUX_uxn_opcodes_h_l105_c15_e740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_005c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_005c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_a941_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_005c_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_a941] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_a941_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_a941_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l101_c7_6f06] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_cond;
     result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iftrue;
     result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_return_output := result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_a941] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_a941] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l85_c7_f2fb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a941_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a941_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_6f06_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a941_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_f2fb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_f2fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l98_c7_9051] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l98_c7_9051_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_cond;
     result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iftrue;
     result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_return_output := result_pc_MUX_uxn_opcodes_h_l98_c7_9051_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_f2fb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_9051_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l93_c7_005c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l93_c7_005c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_cond;
     result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_return_output := result_pc_MUX_uxn_opcodes_h_l93_c7_005c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_005c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l90_c7_a941] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l90_c7_a941_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_cond;
     result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iftrue;
     result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_return_output := result_pc_MUX_uxn_opcodes_h_l90_c7_a941_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_a941_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l85_c7_f2fb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_cond;
     result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output := result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f2fb_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l79_c7_2e8b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_cond;
     result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output := result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_2e8b_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l76_c7_5d05] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_cond;
     result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iftrue;
     result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_return_output := result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;

     -- Submodule level 12
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_5d05_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l70_c2_e6fa] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_cond;
     result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iftrue;
     result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output := result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d6ac_uxn_opcodes_h_l65_l112_DUPLICATE_9f23 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d6ac_uxn_opcodes_h_l65_l112_DUPLICATE_9f23_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d6ac(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_e6fa_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d6ac_uxn_opcodes_h_l65_l112_DUPLICATE_9f23_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d6ac_uxn_opcodes_h_l65_l112_DUPLICATE_9f23_return_output;
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
