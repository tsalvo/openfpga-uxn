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
-- BIN_OP_EQ[uxn_opcodes_h_l70_c6_8d9d]
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_21f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal t8_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l70_c2_3f2e]
signal result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l71_c3_2edd[uxn_opcodes_h_l71_c3_2edd]
signal printf_uxn_opcodes_h_l71_c3_2edd_uxn_opcodes_h_l71_c3_2edd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_174f]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_ab32]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_ab32]
signal t8_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_ab32]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_ab32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_ab32]
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_ab32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_ab32]
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_ab32]
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_ab32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_ab32]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l76_c7_ab32]
signal result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l79_c11_f432]
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal t8_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l79_c7_c3fe]
signal result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_9310]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_ab90]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_ab90]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l85_c7_ab90]
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_ab90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_ab90]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l85_c7_ab90]
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l85_c7_ab90]
signal result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_1f0f]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_92d0]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l90_c7_92d0]
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_92d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_92d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l90_c7_92d0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l90_c7_92d0]
signal result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l93_c11_0031]
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l93_c7_1d9c]
signal tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_1d9c]
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_1d9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_1d9c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_1d9c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l93_c7_1d9c]
signal result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l95_c3_0b3e]
signal CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l96_c21_8163]
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l98_c11_8ee1]
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l98_c7_6522]
signal tmp16_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l98_c7_6522]
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l98_c7_6522]
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l98_c7_6522]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l98_c7_6522]
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l98_c7_6522]
signal result_pc_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c21_d16b]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l101_c11_bba1]
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l101_c7_4630]
signal tmp16_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l101_c7_4630]
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l101_c7_4630]
signal result_pc_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_4630]
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_4630]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l102_c3_39dc]
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l105_c15_0d32]
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c25_f4f4]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_c201]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_35e9]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l105_c15_4ace]
signal MUX_uxn_opcodes_h_l105_c15_4ace_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_4ace_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_4ace_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_4ace_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l107_c11_e09e]
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l107_c7_94a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l107_c7_94a8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d811( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.ram_addr := ref_toks_5;
      base.is_ram_read := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.pc := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d
BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_left,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_right,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e
tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- t8_MUX_uxn_opcodes_h_l70_c2_3f2e
t8_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
t8_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e
result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_cond,
result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue,
result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse,
result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

-- printf_uxn_opcodes_h_l71_c3_2edd_uxn_opcodes_h_l71_c3_2edd
printf_uxn_opcodes_h_l71_c3_2edd_uxn_opcodes_h_l71_c3_2edd : entity work.printf_uxn_opcodes_h_l71_c3_2edd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l71_c3_2edd_uxn_opcodes_h_l71_c3_2edd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f
BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_ab32
tmp16_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_ab32
t8_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
t8_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- result_pc_MUX_uxn_opcodes_h_l76_c7_ab32
result_pc_MUX_uxn_opcodes_h_l76_c7_ab32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_cond,
result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue,
result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse,
result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432
BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_left,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_right,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output);

-- tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe
tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- t8_MUX_uxn_opcodes_h_l79_c7_c3fe
t8_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
t8_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe
result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_cond,
result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue,
result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse,
result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310
BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_ab90
tmp16_MUX_uxn_opcodes_h_l85_c7_ab90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_cond,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_return_output);

-- result_pc_MUX_uxn_opcodes_h_l85_c7_ab90
result_pc_MUX_uxn_opcodes_h_l85_c7_ab90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_cond,
result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue,
result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse,
result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f
BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_92d0
tmp16_MUX_uxn_opcodes_h_l90_c7_92d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l90_c7_92d0
result_pc_MUX_uxn_opcodes_h_l90_c7_92d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_cond,
result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue,
result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse,
result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031
BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_left,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_right,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output);

-- tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c
tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_cond,
tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue,
tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse,
tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c
result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_cond,
result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue,
result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse,
result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e
CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_x,
CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_left,
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_right,
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1
BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_left,
BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_right,
BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l98_c7_6522
tmp16_MUX_uxn_opcodes_h_l98_c7_6522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l98_c7_6522_cond,
tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iftrue,
tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iffalse,
tmp16_MUX_uxn_opcodes_h_l98_c7_6522_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_cond,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_return_output);

-- result_pc_MUX_uxn_opcodes_h_l98_c7_6522
result_pc_MUX_uxn_opcodes_h_l98_c7_6522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l98_c7_6522_cond,
result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iftrue,
result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iffalse,
result_pc_MUX_uxn_opcodes_h_l98_c7_6522_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1
BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_left,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_right,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l101_c7_4630
tmp16_MUX_uxn_opcodes_h_l101_c7_4630 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l101_c7_4630_cond,
tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iftrue,
tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iffalse,
tmp16_MUX_uxn_opcodes_h_l101_c7_4630_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_return_output);

-- result_pc_MUX_uxn_opcodes_h_l101_c7_4630
result_pc_MUX_uxn_opcodes_h_l101_c7_4630 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l101_c7_4630_cond,
result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iftrue,
result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iffalse,
result_pc_MUX_uxn_opcodes_h_l101_c7_4630_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc
BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_left,
BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_right,
BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32
BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_left,
BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_right,
BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_return_output);

-- MUX_uxn_opcodes_h_l105_c15_4ace
MUX_uxn_opcodes_h_l105_c15_4ace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l105_c15_4ace_cond,
MUX_uxn_opcodes_h_l105_c15_4ace_iftrue,
MUX_uxn_opcodes_h_l105_c15_4ace_iffalse,
MUX_uxn_opcodes_h_l105_c15_4ace_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e
BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_left,
BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_right,
BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_return_output,
 tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 t8_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output,
 tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 t8_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_return_output,
 result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_return_output,
 result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output,
 tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output,
 result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output,
 CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output,
 tmp16_MUX_uxn_opcodes_h_l98_c7_6522_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_return_output,
 result_pc_MUX_uxn_opcodes_h_l98_c7_6522_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output,
 tmp16_MUX_uxn_opcodes_h_l101_c7_4630_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_return_output,
 result_pc_MUX_uxn_opcodes_h_l101_c7_4630_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_return_output,
 BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_return_output,
 MUX_uxn_opcodes_h_l105_c15_4ace_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_72e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l71_c3_2edd_uxn_opcodes_h_l71_c3_2edd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_1dd0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_ab32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_f293 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l96_c3_1015 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l99_c3_3cd3 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_4ace_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_4ace_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_4ace_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_4ace_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_8f39_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_c136_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_1f2b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_eea7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_10c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d811_uxn_opcodes_h_l65_l112_DUPLICATE_215c_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_f293 := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_f293;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_1dd0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_1dd0;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_72e4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_72e4;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l107_c11_e09e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_left;
     BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_return_output := BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l79_c11_f432] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_left;
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output := BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l93_c11_0031] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_left;
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output := BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c25_f4f4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l70_c6_8d9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_174f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l98_c11_8ee1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_left;
     BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output := BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l105_c15_0d32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_left;
     BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_return_output := BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c21_d16b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l96_c21_8163] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_left;
     BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_return_output := BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea_return_output := result.is_ram_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_1f2b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_1f2b_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_ab32_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l101_c11_bba1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_left;
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output := BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_eea7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_eea7_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_1f0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_8f39 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_8f39_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_9310] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_c136 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_c136_return_output := result.ram_addr;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_10c4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_10c4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_bba1_return_output;
     VAR_MUX_uxn_opcodes_h_l105_c15_4ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_0d32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_e09e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8d9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_174f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_f432_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_9310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_1f0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_0031_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_8ee1_return_output;
     VAR_MUX_uxn_opcodes_h_l105_c15_4ace_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_f4f4_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l96_c3_1015 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_8163_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l99_c3_3cd3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_d16b_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_10c4_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_10c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_1f2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_1f2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l70_l76_DUPLICATE_1f2b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l93_l90_l85_l79_l76_l101_l70_l98_DUPLICATE_3570_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_c136_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_c136_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_c136_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l79_l70_l98_l76_DUPLICATE_c136_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l101_l98_DUPLICATE_fbd2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l93_l90_l85_l79_l107_l76_l70_l98_DUPLICATE_1e81_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l93_l90_l79_l76_l101_l70_l98_DUPLICATE_b6ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_8f39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_8f39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l70_l85_l76_DUPLICATE_8f39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_eea7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l79_l76_DUPLICATE_eea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l96_c3_1015;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l99_c3_3cd3;
     -- t8_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := t8_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l95_c3_0b3e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_return_output := CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l102_c3_39dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_left;
     BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_return_output := BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l107_c7_94a8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l101_c7_4630] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l107_c7_94a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l98_c7_6522] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_return_output := result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_ab90] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_21f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_right := VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_39dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_0b3e_return_output;
     VAR_printf_uxn_opcodes_h_l71_c3_2edd_uxn_opcodes_h_l71_c3_2edd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_21f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_94a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_94a8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_4630_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_6522_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_t8_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     -- t8_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := t8_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_c201] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l101_c7_4630] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l101_c7_4630_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_cond;
     tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iftrue;
     tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_return_output := tmp16_MUX_uxn_opcodes_h_l101_c7_4630_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_4630] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_4630] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l98_c7_6522] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_return_output;

     -- printf_uxn_opcodes_h_l71_c3_2edd[uxn_opcodes_h_l71_c3_2edd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l71_c3_2edd_uxn_opcodes_h_l71_c3_2edd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l71_c3_2edd_uxn_opcodes_h_l71_c3_2edd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_1d9c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_c201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_4630_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_4630_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_6522_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_4630_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l98_c7_6522] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_35e9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_1d9c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l90_c7_92d0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;

     -- t8_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := t8_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l98_c7_6522] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l98_c7_6522] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l98_c7_6522_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_cond;
     tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iftrue;
     tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_return_output := tmp16_MUX_uxn_opcodes_h_l98_c7_6522_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l105_c15_4ace_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_35e9_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_6522_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_6522_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_6522_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_1d9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l85_c7_ab90] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_return_output := result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;

     -- MUX[uxn_opcodes_h_l105_c15_4ace] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l105_c15_4ace_cond <= VAR_MUX_uxn_opcodes_h_l105_c15_4ace_cond;
     MUX_uxn_opcodes_h_l105_c15_4ace_iftrue <= VAR_MUX_uxn_opcodes_h_l105_c15_4ace_iftrue;
     MUX_uxn_opcodes_h_l105_c15_4ace_iffalse <= VAR_MUX_uxn_opcodes_h_l105_c15_4ace_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l105_c15_4ace_return_output := MUX_uxn_opcodes_h_l105_c15_4ace_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l93_c7_1d9c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_cond;
     tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output := tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l90_c7_92d0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_1d9c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iftrue := VAR_MUX_uxn_opcodes_h_l105_c15_4ace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_92d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_92d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_92d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l85_c7_ab90] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l101_c7_4630] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l101_c7_4630_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_cond;
     result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iftrue;
     result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_return_output := result_pc_MUX_uxn_opcodes_h_l101_c7_4630_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_4630_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_ab90] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_ab90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l98_c7_6522] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l98_c7_6522_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_cond;
     result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iftrue;
     result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_return_output := result_pc_MUX_uxn_opcodes_h_l98_c7_6522_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_ab90] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_6522_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l93_c7_1d9c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_cond;
     result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output := result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_1d9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l90_c7_92d0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_cond;
     result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_return_output := result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_92d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l85_c7_ab90] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_cond;
     result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iftrue;
     result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_return_output := result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_ab90_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l79_c7_c3fe] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_cond;
     result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iftrue;
     result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output := result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_c3fe_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l76_c7_ab32] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_cond;
     result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iftrue;
     result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_return_output := result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;

     -- Submodule level 12
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_ab32_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l70_c2_3f2e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_cond;
     result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output := result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d811_uxn_opcodes_h_l65_l112_DUPLICATE_215c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d811_uxn_opcodes_h_l65_l112_DUPLICATE_215c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d811(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_3f2e_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d811_uxn_opcodes_h_l65_l112_DUPLICATE_215c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d811_uxn_opcodes_h_l65_l112_DUPLICATE_215c_return_output;
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
