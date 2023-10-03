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
-- BIN_OP_EQ[uxn_opcodes_h_l70_c6_e17f]
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_b488]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l70_c2_8be4]
signal tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l70_c2_8be4]
signal t8_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_8be4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_8be4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l70_c2_8be4]
signal result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_8be4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_8be4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_8be4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_8be4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_8be4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_8be4]
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l71_c3_9bff[uxn_opcodes_h_l71_c3_9bff]
signal printf_uxn_opcodes_h_l71_c3_9bff_uxn_opcodes_h_l71_c3_9bff_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_eb66]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_7c08]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_7c08]
signal t8_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_7c08]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_7c08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l76_c7_7c08]
signal result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_7c08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_7c08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_7c08]
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_7c08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_7c08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_7c08]
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l79_c11_2039]
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l79_c7_ece4]
signal tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l79_c7_ece4]
signal t8_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_ece4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_ece4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l79_c7_ece4]
signal result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_ece4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_ece4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_ece4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_ece4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_ece4]
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_396c]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_2c68]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_2c68]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_2c68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l85_c7_2c68]
signal result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l85_c7_2c68]
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_2c68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l85_c7_2c68]
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_b32e]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_b8d2]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_b8d2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_b8d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l90_c7_b8d2]
signal result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l90_c7_b8d2]
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l90_c7_b8d2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l93_c11_be52]
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l93_c7_17bd]
signal tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_17bd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_17bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l93_c7_17bd]
signal result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_17bd]
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_17bd]
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l95_c3_ea1d]
signal CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l96_c21_dead]
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l98_c11_990e]
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l98_c7_d3a8]
signal tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l98_c7_d3a8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l98_c7_d3a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l98_c7_d3a8]
signal result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l98_c7_d3a8]
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l98_c7_d3a8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c21_ca7e]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l101_c11_ca12]
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l101_c7_18f5]
signal tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_18f5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l101_c7_18f5]
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_18f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l101_c7_18f5]
signal result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l102_c3_3c36]
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l105_c15_8d2b]
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c25_b19c]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_c8a8]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_dcde]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l105_c15_19af]
signal MUX_uxn_opcodes_h_l105_c15_19af_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_19af_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_19af_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_19af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l107_c11_9fd0]
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l107_c7_138c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l107_c7_138c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_af31( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_ram_read := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f
BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_left,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_right,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_return_output);

-- tmp16_MUX_uxn_opcodes_h_l70_c2_8be4
tmp16_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- t8_MUX_uxn_opcodes_h_l70_c2_8be4
t8_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
t8_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
t8_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
t8_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l70_c2_8be4
result_pc_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

-- printf_uxn_opcodes_h_l71_c3_9bff_uxn_opcodes_h_l71_c3_9bff
printf_uxn_opcodes_h_l71_c3_9bff_uxn_opcodes_h_l71_c3_9bff : entity work.printf_uxn_opcodes_h_l71_c3_9bff_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l71_c3_9bff_uxn_opcodes_h_l71_c3_9bff_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66
BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_7c08
tmp16_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_7c08
t8_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
t8_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- result_pc_MUX_uxn_opcodes_h_l76_c7_7c08
result_pc_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_cond,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039
BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_left,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_right,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output);

-- tmp16_MUX_uxn_opcodes_h_l79_c7_ece4
tmp16_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- t8_MUX_uxn_opcodes_h_l79_c7_ece4
t8_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
t8_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
t8_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
t8_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l79_c7_ece4
result_pc_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c
BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_2c68
tmp16_MUX_uxn_opcodes_h_l85_c7_2c68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_return_output);

-- result_pc_MUX_uxn_opcodes_h_l85_c7_2c68
result_pc_MUX_uxn_opcodes_h_l85_c7_2c68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_cond,
result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue,
result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse,
result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_cond,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e
BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2
tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2
result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_cond,
result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue,
result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse,
result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52
BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_left,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_right,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output);

-- tmp16_MUX_uxn_opcodes_h_l93_c7_17bd
tmp16_MUX_uxn_opcodes_h_l93_c7_17bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_cond,
tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_return_output);

-- result_pc_MUX_uxn_opcodes_h_l93_c7_17bd
result_pc_MUX_uxn_opcodes_h_l93_c7_17bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_cond,
result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue,
result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse,
result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_return_output);

-- CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d
CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_x,
CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_left,
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_right,
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e
BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_left,
BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_right,
BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8
tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_cond,
tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue,
tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse,
tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8
result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_cond,
result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue,
result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse,
result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12
BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_left,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_right,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output);

-- tmp16_MUX_uxn_opcodes_h_l101_c7_18f5
tmp16_MUX_uxn_opcodes_h_l101_c7_18f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_cond,
tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue,
tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse,
tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l101_c7_18f5
result_pc_MUX_uxn_opcodes_h_l101_c7_18f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_cond,
result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue,
result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse,
result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36
BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_left,
BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_right,
BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b
BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_left,
BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_right,
BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_return_output);

-- MUX_uxn_opcodes_h_l105_c15_19af
MUX_uxn_opcodes_h_l105_c15_19af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l105_c15_19af_cond,
MUX_uxn_opcodes_h_l105_c15_19af_iftrue,
MUX_uxn_opcodes_h_l105_c15_19af_iffalse,
MUX_uxn_opcodes_h_l105_c15_19af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0
BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_left,
BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_right,
BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_return_output,
 tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 t8_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output,
 tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 t8_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_return_output,
 result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output,
 result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output,
 tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_return_output,
 result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_return_output,
 CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output,
 tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output,
 result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output,
 tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_return_output,
 result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_return_output,
 MUX_uxn_opcodes_h_l105_c15_19af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_a67a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l71_c3_9bff_uxn_opcodes_h_l71_c3_9bff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_9c2c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_7c08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_9f5a : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l96_c3_50b6 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l99_c3_eb45 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_19af_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_19af_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_19af_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_19af_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_9561_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_e7bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_f989_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_6eb7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_5d8b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af31_uxn_opcodes_h_l65_l112_DUPLICATE_df57_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_9c2c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_9c2c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_right := to_unsigned(8, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_9f5a := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_9f5a;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_a67a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_a67a;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_f989 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_f989_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_396c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l105_c15_8d2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_e7bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_e7bf_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l79_c11_2039] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_left;
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output := BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_9561 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_9561_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_6eb7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_6eb7_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l98_c11_990e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_left;
     BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output := BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_b32e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c21_ca7e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_5d8b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_5d8b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l107_c11_9fd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l70_c6_e17f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_left;
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output := BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l93_c11_be52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_left;
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output := BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_eb66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c25_b19c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l96_c21_dead] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_left;
     BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_return_output := BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l101_c11_ca12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_left;
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output := BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_7c08_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_ca12_return_output;
     VAR_MUX_uxn_opcodes_h_l105_c15_19af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_8d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_9fd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_e17f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_eb66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_2039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_396c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b32e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_be52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_990e_return_output;
     VAR_MUX_uxn_opcodes_h_l105_c15_19af_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_b19c_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l96_c3_50b6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_dead_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l99_c3_eb45 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_ca7e_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_5d8b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_5d8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_9561_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_9561_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_9561_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_l85_DUPLICATE_fd1f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_f989_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_f989_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_f989_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_f989_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l79_l107_l76_l101_l98_l93_l90_l85_DUPLICATE_1645_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l79_l107_l76_l70_l98_l93_l90_l85_DUPLICATE_7dea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l79_l76_l101_l70_l98_l93_l90_DUPLICATE_d172_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_e7bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_e7bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_e7bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_6eb7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_6eb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l96_c3_50b6;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l99_c3_eb45;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l107_c7_138c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l95_c3_ea1d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_return_output := CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l102_c3_3c36] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_left;
     BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_return_output := BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l98_c7_d3a8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_2c68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_b488] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_return_output;

     -- t8_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     t8_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     t8_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := t8_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l107_c7_138c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l101_c7_18f5] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_right := VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_3c36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_ea1d_return_output;
     VAR_printf_uxn_opcodes_h_l71_c3_9bff_uxn_opcodes_h_l71_c3_9bff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_b488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_138c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_138c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_t8_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_18f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_18f5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- t8_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := t8_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_c8a8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l98_c7_d3a8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l101_c7_18f5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_cond;
     tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_return_output := tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_17bd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;

     -- printf_uxn_opcodes_h_l71_c3_9bff[uxn_opcodes_h_l71_c3_9bff] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l71_c3_9bff_uxn_opcodes_h_l71_c3_9bff_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l71_c3_9bff_uxn_opcodes_h_l71_c3_9bff_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c8a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l90_c7_b8d2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_dcde] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l98_c7_d3a8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_cond;
     tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output := tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_17bd] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l98_c7_d3a8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;

     -- t8_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     t8_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     t8_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := t8_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l98_c7_d3a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l105_c15_19af_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_dcde_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_17bd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l93_c7_17bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_cond;
     tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_return_output := tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_17bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l90_c7_b8d2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l85_c7_2c68] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_return_output := result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;

     -- MUX[uxn_opcodes_h_l105_c15_19af] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l105_c15_19af_cond <= VAR_MUX_uxn_opcodes_h_l105_c15_19af_cond;
     MUX_uxn_opcodes_h_l105_c15_19af_iftrue <= VAR_MUX_uxn_opcodes_h_l105_c15_19af_iftrue;
     MUX_uxn_opcodes_h_l105_c15_19af_iffalse <= VAR_MUX_uxn_opcodes_h_l105_c15_19af_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l105_c15_19af_return_output := MUX_uxn_opcodes_h_l105_c15_19af_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue := VAR_MUX_uxn_opcodes_h_l105_c15_19af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_b8d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l85_c7_2c68] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_b8d2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_b8d2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l101_c7_18f5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_cond;
     result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_return_output := result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_18f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_2c68] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_2c68] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_2c68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l98_c7_d3a8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_cond;
     result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output := result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_d3a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l93_c7_17bd] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_cond;
     result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iftrue;
     result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_return_output := result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_17bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l90_c7_b8d2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_cond;
     result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output := result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_b8d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l85_c7_2c68] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_cond;
     result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iftrue;
     result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_return_output := result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_2c68_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l79_c7_ece4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_cond;
     result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_return_output := result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_ece4_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l76_c7_7c08] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_cond;
     result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iftrue;
     result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_return_output := result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;

     -- Submodule level 12
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_7c08_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l70_c2_8be4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_cond;
     result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_return_output := result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_af31_uxn_opcodes_h_l65_l112_DUPLICATE_df57 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af31_uxn_opcodes_h_l65_l112_DUPLICATE_df57_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_af31(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_8be4_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_8be4_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af31_uxn_opcodes_h_l65_l112_DUPLICATE_df57_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af31_uxn_opcodes_h_l65_l112_DUPLICATE_df57_return_output;
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
